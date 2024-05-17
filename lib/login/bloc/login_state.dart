part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.message = "",
  });

  final FormzStatus status;

  final String message;

  LoginState copyWith(
      {FormzStatus? status, String? message, bool? isPinAvailable}) {
    return LoginState(
        status: status ?? this.status, message: message ?? this.message);
  }

  @override
  List<Object> get props => [status, message];
}

class UnAuthorizedState extends LoginState {
  final String message;

  const UnAuthorizedState({
    required this.message,
  });
}
