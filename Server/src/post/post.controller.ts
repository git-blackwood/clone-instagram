import { Controller, Post, UploadedFile, UseGuards, UseInterceptors } from '@nestjs/common';
import { CreatePostDto } from './dto/create-post.dto';
import { AuthGuard } from '@nestjs/passport';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';

@Controller('post')
export class PostController {
    
    @Post()
    // @UseGuards(AuthGuard()) // Todo: 로그인한 사용자만 사용하도록 수정 필요
    @UseInterceptors(FileInterceptor("file", {
            storage: diskStorage({
                destination: "../../images",
                filename: (req, file, callback) => {
                    console.log(req);
                    // const extArray = file.mimetype.split('/');
                    // // 저는 파일명을 DB에 저장하고 불러오는 방식으로 처리할 예정이라 랜덤문자열로 저장하였습니다.
                    // const randomString = Math.random().toString(36).substring(2, 12);
                    // callback(null, randomString + '.' + extArray[extArray.length - 1]);
                },
            })
        },    
    ))
    async createPost(@UploadedFile() file: Express.Multer.File): Promise<boolean> {
        console.log(file);
        return true;
    }
}
