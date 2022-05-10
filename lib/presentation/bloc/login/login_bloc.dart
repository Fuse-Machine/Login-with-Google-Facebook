import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  var userController = TextEditingController();
  var passController = TextEditingController();
  final _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginWithEmail) {
        String _userEmail = userController.text;
        //String _password = passController.text;

        if (_validateEmail(_userEmail)) {
          emit(LoggedInWithEmail(
              loggedIn: true, email: _userEmail, name: 'Your name'));
          //check to db
        }
      }
      if (event is LoginWithGoogle) {
        googleAccount.value = await _googleSignin.signIn();
        emit(LoggedInWithGmail(googleAccount: googleAccount.value!));
      }
      if (event is GoogleLogout) {
        googleAccount.value = await _googleSignin.signOut();
      }
    });
  }
  bool _validateEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
