import 'package:get_it/get_it.dart';
import 'package:spotify/data/data_sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/repository/auth_repository_impl.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';

final service_locator = GetIt.instance;

Future<void> initializedDependencies()async{
  service_locator.registerSingleton<AuthenticationFirebaseService>(
    AuthenticationFirebaseServiceImpl()
  );

 service_locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

   service_locator.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

    service_locator.registerSingleton<SignupIneCase>(
    SignupIneCase()
  );
}