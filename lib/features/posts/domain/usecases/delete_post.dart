import 'package:clean_architecture_posts_app/core/error/Failures.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase{
  
  final PostsRepository repository;
  
  DeletePostUseCase(this.repository);
  
  Future<Either<Failure,Unit>>call(int postId)async{
    return await repository.deletePost(postId);

  }

}