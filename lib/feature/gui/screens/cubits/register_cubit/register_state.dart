part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterFailure extends RegisterState {}
class RegisterVerifyUserName extends RegisterState {}
class RegisterVerifyUserNameIsNull extends RegisterState {}
class CheckBox extends RegisterState {}
class ShowOrHidePassword extends RegisterState {}
class ConnectionTimedOut extends RegisterState {}

