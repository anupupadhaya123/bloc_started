abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmittedEvenet extends SignInEvent {
  final String email;
  final String password;

  SignInSubmittedEvenet(this.email, this.password);
}
