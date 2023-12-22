import 'package:clean_architecture_posts_app/core/network/network_info.dart';
import 'package:clean_architecture_posts_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:clean_architecture_posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_posts_app/features/posts/data/repositories/post_repository_impl.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/usecases/add_post.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/usecases/delete_post.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/usecases/get_all_posts.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/usecases/update_post.dart';
import 'package:clean_architecture_posts_app/features/posts/presentation/bloc/add_update_delete_post/add_delete_update_post_bloc.dart';
import 'package:clean_architecture_posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - posts:
  //1 - Dependencies injection for the bloc:
  sl.registerFactory(() => PostsBloc(getAllPostsUseCase: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPost: sl(), deletePost: sl(), updatePost: sl()));
//2 - Dependencies injection for the useCases:
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
//3 - Dependencies injection for the repository:
  sl.registerLazySingleton(() => PostRepositoryImpl(
      remoteDataSource: sl(), localeDataSource: sl(), networkInfo: sl()));
//4 - Dependencies injection for the dataSources:
  sl.registerLazySingleton(() => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

  // Core :
  // Network Info:
  sl.registerLazySingleton(() => NetworkInfoImpl(sl()));
  //External
  //1 SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  //2 Http
  sl.registerLazySingleton(() => http.Client());
  //3 Internet connection checker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

/*Designe pattern :
singleton
factory*/
