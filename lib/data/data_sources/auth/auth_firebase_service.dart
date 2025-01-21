import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';

abstract class AuthenticationFirebaseService {
  Future<Either> signin(SigninUserRequest signInUserRequest);
  Future<Either> signup(CreateUserReq createUserReq);
}

class AuthenticationFirebaseServiceImpl extends AuthenticationFirebaseService {
  @override
  Future<Either> signin(SigninUserRequest signInUserRequest) async{
try{
   final result =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: signInUserRequest.email, password: signInUserRequest.password);
    return Right("welcome ${result.user?.displayName}");
}on FirebaseAuthMultiFactorException catch(e){
  return Left(e.code.toString());
}
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      return const Right("Success signup");
    } on FirebaseAuthException catch (e) {
      return Left(e.code.toString());
    }
  }
}
