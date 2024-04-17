import 'package:equatable/equatable.dart';
import 'package:monify/src/features/home/domain/entity/transaction.dart';

import '../../../../comman/usecases/usecase.dart';
import '../../data/models/transaction_model.dart';
import '../repository/transaction_repo.dart';

class AddTransactionUseCase implements UseCase<dynamic, AddTransactionParam> {
  final TransactionRepository _repository;

  AddTransactionUseCase(this._repository);

  @override
  Future<TransactionEntity> call(AddTransactionParam params) async {
    return await _repository.addTransaction(
        uid: params.uid,
        amount: params.amount,
        transactionType: params.transactionType,
        transactionDate: params.transactionDate,
        transactionName: params.transactionName);
  }
}

class AddTransactionParam extends Equatable {
  final String uid;
  final double amount;
  final String transactionName;
  final String transactionType;
  final DateTime transactionDate;

  const AddTransactionParam({
    required this.uid,
    required this.amount,
    required this.transactionName,
    required this.transactionType,
    required this.transactionDate,
  });

  @override
  List<Object?> get props =>
      [uid, amount, transactionName, transactionDate, transactionType];
}
