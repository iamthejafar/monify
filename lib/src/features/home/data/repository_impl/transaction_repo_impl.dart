
import 'package:monify/src/features/home/domain/entity/transaction.dart';

import '../../domain/repository/transaction_repo.dart';
import '../data_source/transaction_remote_data_source.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource _apiService;
  TransactionRepositoryImpl(this._apiService);

  @override
  Future<TransactionEntity> addTransaction({required String uid, required double amount, required String transactionType, required String transactionName, required DateTime transactionDate}) async{
    try{
      final entity = await _apiService.addTransaction(uid: uid, amount: amount, transactionType: transactionType, transactionName: transactionName, transactionDate: transactionDate);
      return entity;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactions({required String uid}) async {
    try{
      final transactions = await _apiService.getTransactions(uid: uid);
      return transactions;
    } catch (e) {
      return Future.error(e);
    }
  }

}