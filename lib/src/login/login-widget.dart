import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:aprendendo_bloc/src/login/login-bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Bloc'),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            emailField(bloc),
            SizedBox(
              height: 10.0,
            ),
            passworldField(bloc),
            SizedBox(
              height: 40.0,
            ),
            loginButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return TextField(
          onChanged: bloc.updateEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'email@example.com',
            labelText: 'Email',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passworldField(bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return TextField(
          onChanged: bloc.updatePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Sua senha',
            labelText: 'Senha',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget loginButton(LoginBloc stateMgmtBloc) {
    return StreamBuilder(
      stream: stateMgmtBloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return RaisedButton(
          child: Text('Entrar e navegar para próxima tela'),
          color: Colors.blue[200],
          onPressed: snapshot.hasData
              ? () => Navigator.pushNamed(context, "/secondscreen")
              : null, //desabilita o botão em caso de erro.
        );
      },
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Container(
        margin: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            buildText(bloc),
          ],
        ),
      ),
    );
  }

  Widget buildText(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Text('Você esta logado como ${snapshot.data}');
      },
    );
  }
}
