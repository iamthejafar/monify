
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monify/src/features/auth/data/models/user_model.dart';

import '../../domain/repository/auth_repo.dart';
import '../data_source/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _apiService;
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
  Future <UserCredential> signUp({required String email, required String password,required String name}) async {
    try {
      final res =
      await _apiService.signUp(email: email,password: password, name: name);
      return res;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<UserModel> getUser({required String uid}) async {
    try {
      final res =
          await _apiService.getUser(uid: uid);
      return res;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}