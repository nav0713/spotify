import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';

abstract class AuthRepository{
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserRequest signInUserRequest);
}