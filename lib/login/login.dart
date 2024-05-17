import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyapar_app/login/repository/login_repository.dart';

import 'bloc/login_bloc.dart';
import 'login_body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => LoginBloc(
                  repository: LoginRepository(),
                ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 20, bottom: 20),
              child: LoginBody(),
            )));
  }
}
