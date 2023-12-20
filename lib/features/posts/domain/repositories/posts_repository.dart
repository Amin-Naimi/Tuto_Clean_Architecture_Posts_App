/* Domaine layer and data layer se communique ensemble grace au 
repository */

import 'package:clean_architecture_posts_app/core/error/Failures.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  // cette repository sera implementer aprés par le repository in the "data layer"
  Future<Either<Failure,List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePost(int postId);
  Future<Either<Failure, Unit>> updatePost(Post newPost);
  Future<Either<Failure, Unit>> addPost(Post newPost);
}
//<Failure,bool> ou <Failure<List<Post>>>
//Dart ne contient pas ça par défaut
// donc on utlise la package "dartz"
// Unit spécifique au package "dartz" (ne retourne rien)
// dans dart on ne peut pas retourner void : Future<void> : ça c'est faut  c'est pour ça qu'on utlise "Unit" de dartz.