import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monify/src/comman/dialogs/loading_dialog.dart';
import 'package:monify/src/core/app/router/router.gr.dart';
import 'package:monify/src/features/auth/data/models/user_model.dart';
import 'package:monify/src/features/auth/domain/entity/user.dart';
import 'package:monify/src/utils/dependency_injection.dart';
import 'package:monify/src/utils/user_preferences.dart';

import '../../../auth/domain/usecase/get_user.dart';
import '../../domain/entity/transaction.dart';
import '../../domain/usecase/add_transaction.dart';
import '../../domain/usecase/get_transactions.dart';
import '../../domain/usecase/get_transactions.dart';



enum HomeLoadingState {
  idle,
  loading,
  loaded,
  error,
}
class GetTransactionState {

  final List<TransactionEntity> transactions;
  final List<UserEntity> userModel;

  final HomeLoadingState loadingState;

  GetTransactionState({required this.transactions, required this.userModel, this.loadingState = HomeLoadingState.idle,});


}

final getTransactionProvider = StateNotifierProvider<GetTransactionStateNotifier, GetTransactionState>(
      (ref) => GetTransactionStateNotifier(locator(),locator()),
);

class GetTransactionStateNotifier extends StateNotifier<GetTransactionState> {
  final GetTransactionUseCase getTransactionUseCase;

  final GetUserUseCase getUserUseCase;

  GetTransactionStateNotifier(this.getTransactionUseCase, this.getUserUseCase) : super(GetTransactionState(transactions: [], userModel: [])){
getTransaction(uid: UserPreferences.userId);
  }

  Future<void> getTransaction({
    required String uid,
  }) async {
    try {
      state = GetTransactionState(transactions: state.transactions, userModel: state.userModel, loadingState: HomeLoadingState.loading);
      final transactionsList = await getTransactionUseCase.call(
        GetTransactionParam(
          uid: uid,
        ),
      );


      final userModel = await getUserUseCase.call(GetUserParams(uid: uid));



      state = GetTransactionState(transactions: transactionsList, userModel: [userModel], loadingState: HomeLoadingState.loaded);
    } on Exception catch (e) {
      state = GetTransactionState(transactions: state.transactions, userModel: state.userModel, loadingState: HomeLoadingState.error);
      print(e.toString());
    }
  }}
