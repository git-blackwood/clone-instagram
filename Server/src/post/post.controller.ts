import { Controller, Post, UseGuards } from '@nestjs/common';
import { CreatePostDto } from './dto/create-post.dto';
import { AuthGuard } from '@nestjs/passport';

@Controller('post')
export class PostController {
    
    @Post()
    @UseGuards(AuthGuard())
    async createPost(createPostDto: CreatePostDto): Promise<boolean> {
        return true;
    }
}
