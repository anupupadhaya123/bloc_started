import 'package:bloc_app/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_app/screens/sign_in/bloc/sign_in_event.dart';
import 'package:bloc_app/screens/sign_in/bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailController.text, passwordController.text));
              },
              decoration: const InputDecoration(hintText: "Email Address"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailController.text, passwordController.text));
              },
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  color:
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvenet(
                              emailController.text, passwordController.text));
                    }
                  },
                  child: const Text("Sign In"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
