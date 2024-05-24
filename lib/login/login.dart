import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyapar_app/login/repository/login_repository.dart';

import 'bloc/login_bloc.dart';
import 'login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => LoginBloc(
                  repository: LoginRepository(),
                ),
            child: const Padding(
              padding:
                  EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
              child: LoginBody(),
            )));
  }
}
