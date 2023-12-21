import 'package:clean_architecture_posts_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostLocaleDataSource{
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postList);
} 

class PostLocalDataSourceImpl implements PostLocaleDataSource{
  @override
  Future<Unit> cachePosts(List<PostModel> postList) {
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
  }

}
/* 
class PostLocalDataSourceImplWithMYSql implements PostLocaleDataSource{}
class PostLocalDataSourceImplWithSahredPreferences implements PostLocaleDataSource{}*/