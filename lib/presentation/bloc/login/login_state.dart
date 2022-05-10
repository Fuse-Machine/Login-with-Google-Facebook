part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

// ignore: must_be_immutable
class LoggedInWithEmail extends LoginState {
  String email;
  String name;
  bool loggedIn;
  LoggedInWithEmail(
      {required this.loggedIn, required this.email, required this.name});
}

// ignore: must_be_immutable
class LoggedInWithGmail extends LoginState {
  GoogleSignInAccount googleAccount;
  LoggedInWithGmail({required this.googleAccount});
}

class LoggedInWithFacebook extends LoginState {}
