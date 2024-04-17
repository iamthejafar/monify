import 'package:equatable/equatable.dart';
import 'package:monify/src/features/home/domain/entity/transaction.dart';

import '../../../../comman/usecases/usecase.dart';
import '../../data/models/transaction_model.dart';
import '../repository/transaction_repo.dart';

class GetTransactionUseCase implements UseCase<dynamic, GetTransactionParam> {
  final TransactionRepository _repository;

  GetTransactionUseCase(this._repository);

  @override
  Future <List<TransactionEntity>> call(GetTransactionParam params) async {
    return await _repository.getTransactions(
        uid: params.uid,);
  }
}

class GetTransactionParam extends Equatable {
  final String uid;

  const GetTransactionParam({
    required this.uid,
  });

  @override
  List<Object?> get props =>
      [uid];
}
