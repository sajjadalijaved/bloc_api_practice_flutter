part of 'user_bloc_bloc.dart';

@immutable
abstract class UserBlocState {}

class UserInitialState extends UserBlocState {
  UserInitialState();
}

class UserLoadingState extends UserBlocState {
  UserLoadingState();
}

class UsersLoadedState extends UserBlocState {
  final List<Users> users;
  UsersLoadedState(this.users);
}

class UserLoadedState extends UserBlocState {
  final int userId;
  final String name;
  final String email;
  final String website;
  UserLoadedState(this.userId, this.name, this.email, this.website);
}

class UserErrorState extends UserBlocState {
  final String errormessage;
  UserErrorState(this.errormessage);
}
