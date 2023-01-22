import 'package:bloc_app/screens/sign_in/bloc/sign_in_event.dart';
import 'package:bloc_app/screens/sign_in/bloc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please Enter a valid Email Address"));
      } else if (event.passwordValue.length <= 6) {
        emit(SignInErrorState("Please enter a valid password"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmittedEvenet>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
