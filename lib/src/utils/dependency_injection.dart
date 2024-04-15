

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/data/data_source/remote/auth_api_service.dart';
import '../features/auth/data/repository_impl/auth_repo_impl.dart';
import '../features/auth/domain/usecase/login.dart';
import '../features/auth/domain/usecase/signup.dart';
import '../features/auth/presentation/providers/auth_provider.dart';
final GetIt locator = GetIt.instance;



void initDependency() {
  FirebaseAuth instance = FirebaseAuth.instance;

  locator.registerLazySingleton(() => instance);
  _initAuth();

}

void _initAuth(){
  locator.registerFactory<AuthApiService>(
          () => AuthApiServiceImpl(locator())
  );
  locator.registerLazySingleton<AuthRepositoryImpl>(()=>(AuthRepositoryImpl(locator<AuthApiService>())));
  locator.registerLazySingleton<LoginUseCase>(()=> LoginUseCase(locator<AuthRepositoryImpl>()));
  locator.registerLazySingleton<SignUpUseCase>(()=> SignUpUseCase(locator<AuthRepositoryImpl>()));
  locator.registerLazySingleton<AuthNotifier>(() => AuthNotifier(locator<LoginUseCase>(), locator<SignUpUseCase>()));
}