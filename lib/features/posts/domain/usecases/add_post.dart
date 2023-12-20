import 'package:clean_architecture_posts_app/core/error/Failures.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class AddPostUseCase{

  final PostsRepository repository;
  
  AddPostUseCase(this.repository);

  Future<Either<Failure,Unit>> call(Post post) async{
    return await repository.addPost(post);

  }
}