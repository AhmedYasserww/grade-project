// ignore_for_file: file_names


import 'package:untitled6/features/auth/data/model/auth_model.dart';

abstract class AuthState {}

class RegisterInitialState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  String msg;
  RegisterSuccessState({required this.msg});
}

class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState(this.error);
}
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserModel user;
  LoginSuccessState(this.user);
}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState(this.error);
}

class GetUserLoading extends AuthState {}
class GetUserSuccess extends AuthState {
 final String username; 
  GetUserSuccess(this.username);
}

class GetUserError extends AuthState {
  String error;
  GetUserError(this.error);
}
