import { PassportStrategy } from "@nestjs/passport";
import { CreateUserDto } from "./dto/create-user.dto";
import { Injectable, UnauthorizedException } from "@nestjs/common";
import { Strategy, ExtractJwt } from "passport-jwt";
import { UserRepository } from "./user.repository";

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
    constructor(private userRepository: UserRepository) {
        super({
            jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
            secretOrKey: "TestSecret",
        });
    }

    async validate(createUserDto: CreateUserDto): Promise<any> {
        const user = await this.userRepository.findOne({ where: { username: createUserDto.username }});
        
        if (!user) {
            throw new UnauthorizedException();
        }
        
        return user;
    }
}