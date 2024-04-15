
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../comman/error/failures.dart';
import '../../domain/repository/auth_repo.dart';
import '../data_source/remote/auth_api_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _apiService;
  AuthRepositoryImpl(this._apiService);

  @override
  Future <UserCredential> login({required String email, required String password}) async {
    try {
      final res =
      await _apiService.login(email: email,password: password);
      return res;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future <UserCredential> signUp({required String email, required String password}) async {
    try {
      final res =
      await _apiService.signUp(email: email,password: password);
      return res;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}