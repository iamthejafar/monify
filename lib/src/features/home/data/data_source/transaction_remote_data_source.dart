import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monify/src/features/auth/data/models/user_model.dart';
import 'package:monify/src/features/home/data/models/transaction_model.dart';

abstract interface class TransactionRemoteDataSource {
  Future<TransactionModel> addTransaction(
      {required String uid,
      required double amount,
      required String transactionType,
      required String transactionName,
      required DateTime transactionDate});

  Future<List<TransactionModel>> getTransactions({
    required String uid,
  });
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final CollectionReference _transactionsCollection =
      FirebaseFirestore.instance.collection('Transactions');
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('Users');

  @override
  Future<TransactionModel> addTransaction(
      {required String uid,
      required double amount,
      required String transactionType,
      required String transactionName,
      required DateTime transactionDate}) async {
    TransactionModel transactionModel = TransactionModel(
        uid: uid,
        amount: amount,
        transactionDate: transactionDate,
        transactionName: transactionName,
        transactionType: transactionType);
    try {
      await _transactionsCollection.add(transactionModel.toJson());

      double totalBalance;
      double income;
      double expense;

      final userDoc = await _usersCollection.doc(uid).get();

     if(userDoc.exists){
       final userModel = UserModel.fromSnapshot(userDoc);

       if (transactionModel.transactionType == "Expense") {
         totalBalance = userModel.totalBalance - amount;
         expense = userModel.expense + amount;
         await _usersCollection.doc(uid).set(userModel
             .copyWith(expense: expense, totalBalance: totalBalance)
             .toJson());
       }
       else{
         totalBalance = userModel.totalBalance + amount;
         income = userModel.expense + amount;
         await _usersCollection.doc(uid).set(userModel
             .copyWith(income: income, totalBalance: totalBalance)
             .toJson());
       }
     } else {
       return Future.error("an expected error");
     }

      return transactionModel;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions({required String uid}) async {
    try {
      QuerySnapshot querySnapshot =
          await _transactionsCollection.where("uid", isEqualTo: uid).get();
      List<TransactionModel> transactions = querySnapshot.docs.map((doc) {
        return TransactionModel.fromSnapshot(doc);
      }).toList();

      transactions.sort((a, b) => a.transactionDate.compareTo(b.transactionDate));
      return transactions;
    } catch (e) {
      return Future.error(e);
    }
  }
}
