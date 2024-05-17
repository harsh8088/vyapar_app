import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../config/constants.dart';
import '../repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  bool isFetching = false;

  LoginBloc({
    required this.repository,
  }) : super(LoginState()) {
    on<LoginPhoneChanged>(_onPhoneChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  void _onPhoneChanged(
    LoginPhoneChanged event,
    Emitter<LoginState> emit,
  ) {}

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    // emit(LoadingState(message: 'Loading...'));
    try {
      //print("state.phone.value ${state.phone.value}");
      //print("state.country.value ${state.country.value}");

      emit(state.copyWith(
          status: FormzStatus.submissionFailure, message: "Invalid Number!"));
    } on SocketException {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          message: AppConstants.connectionError));
    } catch (_) {
      print(_.toString());
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          message: AppConstants.serverError));
    }
  }
}
