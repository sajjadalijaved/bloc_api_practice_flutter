import 'package:bloc_api_practice/bloc/user_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    UserBlocBloc userbloc = Provider.of<UserBlocBloc>(context, listen: false);
    //  userbloc.add(FetchUsers());
    return Scaffold(
        appBar: AppBar(
          title: const Text('bloc'),
        ),
        body:
            BlocBuilder<UserBlocBloc, UserBlocState>(builder: (context, state) {
          if (state is UserInitialState) {
            return initialUI();
          } else if (state is UserLoadingState) {
            return loadingUI();
          } else if (state is UsersLoadedState) {
            return loadedUI(state.users);
          } else if (state is UserErrorState) {
            return errorUi(state.errormessage);
          } else {
            return errorUi('user error');
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            userbloc.add(FetchUserEvent());
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }

  Widget initialUI() {
    return const Center(
      child: Text('Click To Load Data'),
    );
  }

  Widget loadingUI() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget loadedUI(List<Users> users) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(child: Text(users[index].id.toString())),
              title: Text(users[index].name.toString()),
              subtitle: Text(users[index].email.toString()),
              trailing: Text(users[index].website.toString()),
            ));
  }

  Widget errorUi(String message) {
    return Container(
      color: Colors.red,
      child: Center(
          child: Text(
        message,
        style: Theme.of(context).textTheme.headline3,
      )),
    );
  }
}
