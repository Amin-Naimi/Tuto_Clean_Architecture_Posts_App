import 'package:bloc/bloc.dart';
import 'package:clean_architecture_posts_app/core/error/Failures.dart';
import 'package:clean_architecture_posts_app/core/strings/Failures.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/usecases/get_all_posts.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;

  PostsBloc({required this.getAllPostsUseCase}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(loadingPostsState());
        final failuresOrPosts = await getAllPostsUseCase();
        // tester si on reçoit le right ou le left
        emit(_mapFailureOrPostsToState(failuresOrPosts));
      } else if (event is RefreshPostsEvent) {
        emit(loadingPostsState());
        final failuresOrPosts = await getAllPostsUseCase();
        // tester si on reçoit le right ou le left
        emit(_mapFailureOrPostsToState(failuresOrPosts));
      }
    });
  }

  PostsState _mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
      (failure) => ErrorPostsState(message: _mapFailureTomessage(failure)),
      (Posts) => LoadedPostsState(
        posts: Posts,
      ),
    );
  }

  String _mapFailureTomessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error try again";
    }
  }
}
