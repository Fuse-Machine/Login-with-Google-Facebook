import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/presentation/bloc/login/login_bloc.dart';
import 'package:login/presentation/page/login_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoggedInWithEmail) {
            return Text(state.loggedIn.toString());
          } else if (state is LoggedInWithGmail) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundImage:
                      Image.network(state.googleAccount.photoUrl ?? "").image,
                  radius: 100,
                ),
                Text(state.googleAccount.displayName ?? ""),
                Text(state.googleAccount.email),
                ActionChip(
                    avatar: const Icon(Icons.logout),
                    label: const Text('Logout'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => LoginBloc()
                              ..add(
                                GoogleLogout(),
                              ),
                            child: const LoginPage(),
                          ),
                        ),
                      );
                      //bloc.add(GoogleLogout());
                    }),
              ],
            );
          }
          return const LoginPage();
        },
      ),
    );
  }
}
