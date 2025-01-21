import 'package:dartz/dartz.dart';
import 'package:spotify/data/data_sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserRequest signInUserRequest)async {
  return await service_locator<AuthenticationFirebaseService>().signin(signInUserRequest);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async{
  return  await service_locator<AuthenticationFirebaseService>().signup(createUserReq);
  }

}