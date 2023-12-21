import 'dart:convert';

import 'package:clean_architecture_posts_app/core/error/exceptions.dart';
import 'package:clean_architecture_posts_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> updatePost(PostModel newPostModel);
  Future<Unit> addPost(PostModel postModel);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  http.Client client;
  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> addPost(PostModel postModel) async {
    final post = {
      "title": postModel.title,
      "body": postModel.body,
    };
    final responce =
        await client.post(Uri.parse("$BASE_URL/posts/"), body: post);
    if (responce.statusCode == 201) {
      return Future.value(unit);
    }
    throw ServerException();
  }

  @override
  Future<Unit> deletePost(int postId) async {
    final responce = await client.delete(
      Uri.parse("$BASE_URL/posts/${postId.toString()}"),
      headers: {"Content-Type": "application/json"},
    );
    if (responce.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    final responce = await client.get(
      Uri.parse("$BASE_URL/posts/"),
      headers: {"Content-Type": "application/json"},
    );
    if (responce.statusCode == 200) {
      final List decodedJson = json.decode(responce.body) as List;
      final List<PostModel> postModels = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(postModels);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel newPostModel) async {
    final postId = newPostModel.id.toString();
    final post = {"title": newPostModel.title, "body": newPostModel.body};
    final responce =
        await client.patch(Uri.parse("$BASE_URL/posts/$postId"), body: post);
    if (responce.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
/*
class PostRemoteDataSourceImplWithDIO implements PostRemoteDataSource{}
class PostRemoteDataSourceImplWithHTTP implements PostRemoteDataSource{}*/