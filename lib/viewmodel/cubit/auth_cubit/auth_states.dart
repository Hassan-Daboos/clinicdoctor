abstract class AuthStates {}

class AuthInitialStates extends AuthStates {}
class RegisterLoadingState extends AuthStates {}
class RegisterSuccessState extends AuthStates {}
class RegisterErrorState extends AuthStates {
  String msg;

  RegisterErrorState(this.msg);
}
class UserLoginLoading extends AuthStates {}
class UserLoginSuccess extends AuthStates {
  String uid;

  UserLoginSuccess(this.uid);
}
class UserLoginError extends AuthStates {
  String msg;

  UserLoginError(this.msg);
}
