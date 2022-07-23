import 'package:bloc/bloc.dart';
import 'package:bloc_api_practice/model/user.dart';
import 'package:meta/meta.dart';

import '../repository/repositor.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final Repository repository = Repository();
  UserBlocBloc() : super(UserInitialState()) {
    on<FetchUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        List<Users> users = await repository.fetchUsersfromRepo();
        emit(UsersLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
