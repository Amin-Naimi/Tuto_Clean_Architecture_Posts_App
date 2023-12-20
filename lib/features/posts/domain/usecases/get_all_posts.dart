import 'package:clean_architecture_posts_app/core/error/Failures.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUseCase{
  final PostsRepository repository;

  GetAllPostsUseCase(this.repository);
 /*Methode_1*/
 Future<Either<Failure,List<Post>>> call()async{
  return await repository.getAllPosts();
 }
 /*
 to execute the methode 1 : 
 soit : - getAllPostsUseCase.call()
 ou   : - getAllPostsUseCase

 */
}