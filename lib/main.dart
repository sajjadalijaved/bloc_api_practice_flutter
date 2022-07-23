import 'package:bloc_api_practice/bloc/user_bloc_bloc.dart';
import 'package:bloc_api_practice/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<UserBlocBloc>(
        create: (context) => UserBlocBloc(),
        child: const HomePage(),
      ),
    );
  }
}
