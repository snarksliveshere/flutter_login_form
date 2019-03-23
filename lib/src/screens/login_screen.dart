import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  var bloc;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    this.bloc = Provider.of(context);
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(children: [
          this.emailField(bloc),
          this.passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          this.submitButton()
        ]));
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'you@example.com',
                labelText: 'Email Address',
                errorText: snapshot.error));
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
              onChanged: bloc.changePassword,
//      obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  errorText: snapshot.error));
        });
  }

  Widget submitButton() {
    return StreamBuilder(
      stream: this.bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
            color: Colors.blue,
            child: Text('login'),
            textColor: Colors.white,
            onPressed: snapshot.hasData
                ? this.bloc.submit
                : null
        );
      },
    );
  }
}
