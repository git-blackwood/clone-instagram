import { Body, Controller, Logger, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateUserDto } from './dto/create-user.dto';
import { User } from './user.entity';

@Controller('auth')
export class AuthController {
    constructor(private authService: AuthService) {}

    @Post("/signin")
    signIn(@Body() createUserDto: CreateUserDto): Promise<{ accessToken: string }> {
        Logger.log(`${createUserDto.username}, ${createUserDto.password}`, "AuthController::signIn");
        return this.authService.signIn(createUserDto);
    }
}
