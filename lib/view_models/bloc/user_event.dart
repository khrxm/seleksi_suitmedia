part of 'user_bloc.dart';

@immutable
abstract class UserEvent  extends Equatable{
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {
  final int page;

  const GetUser({required this.page});

  @override
  List<Object> get props => [page];
}
