part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginWithEmail extends LoginEvent {}

class LoginWithGoogle extends LoginEvent {}

class GoogleLogout extends LoginEvent {}

class LoginWithFacebook extends LoginEvent {}
