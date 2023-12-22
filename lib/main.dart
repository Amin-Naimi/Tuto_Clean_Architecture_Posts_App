import 'package:clean_architecture_posts_app/features/posts/presentation/bloc/add_update_delete_post/add_delete_update_post_bloc.dart';
import 'package:clean_architecture_posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_theme.dart';
import 'injection_container.dart' as dependency_injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dependency_injection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => dependency_injection.sl<PostsBloc>(),
          ),
          BlocProvider(
            create: (_) => dependency_injection.sl<AddDeleteUpdatePostBloc>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          title: 'Post Application',
          home: Scaffold(
              appBar: AppBar(
                title: const Text('Material App Bar'),
              ),
              body: const Center(
                child: Text('Hello World'),
              )),
        ));
  }
}
/*
       providers: [
          BlocProvider(
              create: (_) => PostsBloc(
                      getAllPostsUseCase: GetAllPostsUseCase(
                    PostRepositoryImpl(
                        remoteDataSource:PostRemoteDataSourceImpl(client: Client()),
                        localeDataSource: PostLocalDataSourceImpl(sharedPreferences: sharedPreferences),
                        networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                  ),  )))
        ],


        ==> sans un System de gestion de dependance;
*/