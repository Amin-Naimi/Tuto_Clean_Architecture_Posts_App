import 'package:clean_architecture_posts_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRemoteDataSource{
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> updatePost(PostModel newPostModel);
  Future<Unit> addPost(PostModel postModel);

}
class PostRemoteDataSourceImpl implements PostRemoteDataSource{
  @override
  Future<Unit> addPost(PostModel postModel) {
  }

  @override
  Future<Unit> deletePost(int postId) {
  }

  @override
  Future<List<PostModel>> getAllPosts() {
  }

  @override
  Future<Unit> updatePost(PostModel newPostModel) {
  }

}
/*
class PostRemoteDataSourceImplWithDIO implements PostRemoteDataSource{}
class PostRemoteDataSourceImplWithHTTP implements PostRemoteDataSource{}*/