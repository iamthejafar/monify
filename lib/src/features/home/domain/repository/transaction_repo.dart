import 'dart:async';

import 'package:monify/src/features/home/domain/entity/transaction.dart';

abstract class TransactionRepository {
  Future<TransactionEntity> addTransaction(
      {required String uid,
      required double amount,
      required String transactionType,
      required String transactionName,
      required DateTime transactionDate});

  Future<List<TransactionEntity>> getTransactions({required String uid});
}
