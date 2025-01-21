import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SignupIneCase implements Usecase<Either,SigninUserRequest>{
  @override
  Future<Either> call({SigninUserRequest? params}) async{
    return await service_locator<AuthRepository>().signin(params!);
  }

}