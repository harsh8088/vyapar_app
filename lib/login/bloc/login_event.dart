part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}


class LoginPhoneChanged extends LoginEvent {
  const LoginPhoneChanged(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

class LoginSubmitted extends LoginEvent {

  const LoginSubmitted();

  @override
  List<Object> get props => [];
}
