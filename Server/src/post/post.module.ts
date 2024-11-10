import { Module } from '@nestjs/common';
import { PostController } from './post.controller';
import { PostService } from './post.service';
import { AuthModule } from 'src/auth/auth.module';
import { PassportModule } from '@nestjs/passport';

@Module({
  imports: [AuthModule],
  controllers: [PostController],
  providers: [PostService]
})
export class PostModule {}
