import { Injectable, UnauthorizedException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UserRepository } from './user.repository';
import { User } from './user.entity';
import * as bcrypt from "bcrypt";

@Injectable()
export class AuthService {
    constructor(private userRepository: UserRepository) {}

    async signIn(createUserDto: CreateUserDto): Promise<User> {
        const { username, password } = createUserDto;

        let user = await this.userRepository.findOne({ where: { username } });
        if (!user) {
            // New user -> Sign up
            const salt = await bcrypt.genSalt();
            const hashedPassword = await bcrypt.hash(password, salt);

            user = this.userRepository.create({
                username,
                password: hashedPassword,
            });

            await this.userRepository.save(user);
            return user;
        }

        // User Exists -> Sign in
        if (await bcrypt.compare(password, user.password)) {
            return user;
        } else {
            throw new UnauthorizedException(`Password is wrong`);
        }
    }
}
