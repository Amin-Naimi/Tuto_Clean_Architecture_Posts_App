part of 'add_delete_update_post_bloc.dart';

sealed class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();
  
  @override
  List<Object> get props => [];
}

final class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostState{}

class ErrorAddDeleteUpdatePostState extends AddDeleteUpdatePostState{
  final String message ;
  const ErrorAddDeleteUpdatePostState({required this.message});
    @override
  List<Object> get props => [message];
}
class MessageAddDeletePostState extends AddDeleteUpdatePostState{
  final String message ;
  const MessageAddDeletePostState({required this.message});

  @override
  List<Object> get props => [message];
}