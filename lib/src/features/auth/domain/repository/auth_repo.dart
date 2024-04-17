

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:monify/src/features/auth/domain/entity/user.dart';

abstract class AuthRepository {

  Future <UserCredential> login({required String email, required String password});
  Future <UserCredential> signUp({required String email, required String password, required String name,});
  Future <UserEntity> getUser({required String uid});
}