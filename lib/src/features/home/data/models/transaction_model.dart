import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/transaction.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    required super.uid,
    required super.amount,
    required super.transactionDate,
    required super.transactionName,
    required super.transactionType,
  });

  factory TransactionModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return TransactionModel(
      uid: snapshot.id,
      amount: data['amount'],
      transactionDate: data['transactionDate'].toDate(),
      transactionName: data['transactionName'],
      transactionType: data['transactionType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'amount': amount,
      'transactionDate': transactionDate,
      'transactionName': transactionName,
      'transactionType': transactionType,
    };
  }
}
