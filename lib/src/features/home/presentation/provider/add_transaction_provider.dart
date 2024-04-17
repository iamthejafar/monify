import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monify/src/comman/dialogs/loading_dialog.dart';
import 'package:monify/src/core/app/router/router.gr.dart';
import 'package:monify/src/utils/dependency_injection.dart';

import '../../domain/usecase/add_transaction.dart';

enum AddTransactionState { initial, loading, success, error }

final addTransactionProvider = StateNotifierProvider<AddTransactionStateNotifier, AddTransactionState>(
      (ref) => AddTransactionStateNotifier(locator()),
);

class AddTransactionStateNotifier extends StateNotifier<AddTransactionState> {
  final AddTransactionUseCase addTransactionUseCase;

  AddTransactionStateNotifier(this.addTransactionUseCase) : super(AddTransactionState.initial);

  Future<void> addTransaction({
    required String uid,
    required double amount,
    required String transactionType,
    required String transactionName,
    required DateTime transactionDate,
    required BuildContext context
  }) async {
    try {
      showLoading(context);
      state = AddTransactionState.loading;
       await addTransactionUseCase.call(
        AddTransactionParam(
          uid: uid,
          amount: amount,
          transactionType: transactionType,
          transactionName: transactionName,
          transactionDate: transactionDate,
        ),
      );
      if(context.mounted) {
        context.router.replaceAll([HomeRoute()]);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Transaction Added Succesfully.")));
      }

      state = AddTransactionState.success;
    } on Exception catch (e) {
      state = AddTransactionState.error;
      print(e.toString());
  }
}}
