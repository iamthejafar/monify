import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monify/src/comman/dialogs/error_dialog.dart';
import 'package:monify/src/comman/dialogs/loading_dialog.dart';
import 'package:monify/src/core/app/router/router.gr.dart';

import '../../../../utils/dependency_injection.dart';
import '../../../../utils/user_preferences.dart';
import '../../domain/usecase/login.dart';
import '../../domain/usecase/signup.dart';

enum AuthState { initial, authenticated, unauthenticated }

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthNotifier(this.loginUseCase, this.signUpUseCase)
      : super(AuthState.initial);

  Future<void> login(
      String email, String password, BuildContext context) async {
    showLoading(context);

    try {
      final res = await loginUseCase
          .call(LoginParams(email: email, password: password));
      state = AuthState.authenticated;
      UserPreferences.setUser(userId: res.user!.uid);
      if (context.mounted) context.router.replaceAll([const HomeRoute()]);
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        showErrorDialog(context, message: e.toString());
      }
    }
  }

  Future<void> signUp(
      String email, String password, BuildContext context, String name) async {
    showLoading(context);
    try {
      final res = await signUpUseCase
          .call(SignUpParams(email: email, password: password, name: name));
      state = AuthState.authenticated;
      UserPreferences.setUser(userId: res.user!.uid);
      if (context.mounted) context.router.replaceAll([const HomeRoute()]);
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        showErrorDialog(context, message: e.toString());
      }
    }
  }

  Future<void> signOut() async {
    state = AuthState.unauthenticated;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return locator<AuthNotifier>();
});
