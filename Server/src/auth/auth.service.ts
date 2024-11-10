import { Injectable, Logger, UnauthorizedException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UserRepository } from './user.repository';
import { User } from './user.entity';
import * as bcrypt from "bcrypt";
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
    constructor(private userRepository: UserRepository, private jwtService: JwtService) {}

    async signIn(createUserDto: CreateUserDto): Promise<{ accessToken: string }> {
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
        }

        Logger.log(`${user.username}, ${user.password}`, "AuthService::signIn");

        // User Exists -> Sign in
        if (await bcrypt.compare(password, user.password)) {
            return { accessToken: this.jwtService.sign({ username: user.username })};
        } else {
            throw new UnauthorizedException(`Password is wrong`);
        }
    }
}
