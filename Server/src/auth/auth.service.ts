import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UserRepository } from './user.repository';
import { User } from './user.entity';

@Injectable()
export class AuthService {
    constructor(private userRepository: UserRepository) {}

    async signIn(createUserDto: CreateUserDto): Promise<User> {
        const { username, password } = createUserDto;

        let user = await this.userRepository.findOne({ where: { username } });
        if (user) {
            // Already Sign up
            return user;
        }

        // New user -> Sign up
        user = this.userRepository.create({
            username,
            password,
        });

        console.log(user);

        await this.userRepository.save(user);
        return user;
    }
}
