import 'package:clean_architecture_posts_app/core/error/Failures.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUseCase{
 
 final PostsRepository repository;
 
  UpdatePostUseCase(this.repository);

  Future<Either<Failure,Unit>> call(Post newPost) async{
    
    return await repository.updatePost(newPost);
  }

}