import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/presentation/bloc/login/login_bloc.dart';
import 'package:login/presentation/page/dashboard.dart';
import 'package:login/presentation/widget/login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = BlocProvider.of(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: const Color.fromARGB(255, 69, 96, 202),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.grey,
              ),
            ],
          ),
          Positioned(
            top: 300,
            left: 10,
            child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 69, 96, 202),
                      blurRadius: 17.0,
                      spreadRadius: 5.0,
                      offset:
                          Offset(0.0, 0.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.height / 2,
                  child: _loginForm(context, bloc),
                )),
          )
        ],
      ),
    );
  }

  _loginForm(BuildContext context, LoginBloc bloc) {
    return Card(
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: bloc.userController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: bloc.passController,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye),
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => LoginBloc()
                        ..add(
                          LoginWithEmail(),
                        ),
                      child: const Dashboard(),
                    ),
                  ),
                );
              },
              child: const SizedBox(
                width: 250,
                child: Center(child: Text('Login')),
              ),
            ),
            const SizedBox(height: 15),
            _dividerWithText('Sign in With'),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoginButton(
                  label: 'Google',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => LoginBloc()
                            ..add(
                              LoginWithGoogle(),
                            ),child: const Dashboard(),
                        ),
                        
                      ),
                    );

                   
                  },
                  backgroundColor: Colors.white,
                  imagePath: 'assets/images/google_logo.png',
                  textColor: Colors.green,
                ),
                LoginButton(
                  label: 'Facebook',
                  function: () {},
                  backgroundColor: Colors.white,
                  imagePath: 'assets/images/facebook_logo.png',
                  textColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _dividerWithText(String label) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: const Divider(
              color: Colors.black,
              height: 10,
            )),
      ),
      Text(label),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: const Divider(
              color: Colors.black,
              height: 10,
            )),
      ),
    ]);
  }
}
