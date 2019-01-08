import 'package:aprendendo_bloc/src/login/login-bloc.dart';
import 'package:aprendendo_bloc/src/login/login-widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/secondscreen': (context) => SecondScreen(),
        },
      ),
      bloc: LoginBloc(),
    );
  }
}
