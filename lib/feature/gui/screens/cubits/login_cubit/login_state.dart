part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailure extends LoginState {}
class EPassword extends LoginState {}
class LoginVerifyUsername extends LoginState {}
class ShowPassword extends LoginState {}
class LoginCheckBox extends LoginState {}
class LoginChNot extends LoginState {}





class ShowOrHidePassword extends LoginState {}

