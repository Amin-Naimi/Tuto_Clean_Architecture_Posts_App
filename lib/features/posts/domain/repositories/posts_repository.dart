/* Domaine layer and data layer se communique ensemble grace au 
repository */

import 'package:clean_architecture_posts_app/features/posts/domain/entities/post.dart';

abstract class PostsRepository {
  // cette repository sera implementer aprés par le repository in the "data layer"
  Future<List<Post>> getAllPosts();
  Future<bool> deletePost(int postId);
  Future<bool> updatePost(Post newPost);
  Future<bool> addPost(Post newPost);
}
//<Failure,bool> ou <Failure<List<Post>>>
//Dart ne contient pas ça par défaut
// donc on utlise la package "dartz"