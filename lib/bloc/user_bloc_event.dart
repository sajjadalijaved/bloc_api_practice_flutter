part of 'user_bloc_bloc.dart';

@immutable
abstract class UserBlocEvent {}

class FetchUsers extends UserBlocEvent {}

class FetchUserEvent extends UserBlocEvent {
//    final int userId;
//  FetchUserEvent(this.userId);
}
