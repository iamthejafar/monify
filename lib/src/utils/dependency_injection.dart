import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:monify/src/features/auth/domain/usecase/get_user.dart';
import 'package:monify/src/features/home/domain/usecase/get_transactions.dart';

import '../features/auth/data/data_source/remote/auth_remote_data_source.dart';
import '../features/auth/data/repository_impl/auth_repo_impl.dart';
import '../features/auth/domain/usecase/login.dart';
import '../features/auth/domain/usecase/signup.dart';
import '../features/auth/presentation/providers/auth_provider.dart';
import '../features/home/data/data_source/transaction_remote_data_source.dart';
import '../features/home/data/repository_impl/transaction_repo_impl.dart';
import '../features/home/domain/repository/transaction_repo.dart';
import '../features/home/domain/usecase/add_transaction.dart';
import '../features/home/presentation/provider/transaction_provider.dart';

final GetIt locator = GetIt.instance;

void initDependency() {
  FirebaseAuth instance = FirebaseAuth.instance;

  locator.registerLazySingleton(() => instance);
  _initAuth();
  _initTransaction();
}

void _initAuth() {
  locator.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<AuthRepositoryImpl>(
      () => (AuthRepositoryImpl(locator<AuthRemoteDataSource>())));
  locator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(locator<AuthRepositoryImpl>()));
  locator.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(locator<AuthRepositoryImpl>()));
  locator.registerLazySingleton<GetUserUseCase>(
          () => GetUserUseCase(locator<AuthRepositoryImpl>()));
  locator.registerLazySingleton<AuthNotifier>(
      () => AuthNotifier(locator<LoginUseCase>(), locator<SignUpUseCase>()));

}

void _initTransaction() {
  locator.registerFactory<TransactionRemoteDataSource>(
      () => TransactionRemoteDataSourceImpl());
  locator.registerLazySingleton<TransactionRepository>(
      () => TransactionRepositoryImpl(locator<TransactionRemoteDataSource>()));

  locator.registerLazySingleton<AddTransactionUseCase>(
      () => AddTransactionUseCase(locator<TransactionRepository>()));
  locator.registerLazySingleton<GetTransactionUseCase>(
          () => GetTransactionUseCase(locator<TransactionRepository>()));



}
