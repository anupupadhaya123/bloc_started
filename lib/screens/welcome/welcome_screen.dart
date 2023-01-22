import 'package:bloc_app/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_app/screens/sign_in/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CupertinoButton(
              child: const Text("Sign In with Email"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SignInBloc(),
                        child: SignInScreen(),
                      ),
                    ));
              })
        ],
      ),
    );
  }
}
