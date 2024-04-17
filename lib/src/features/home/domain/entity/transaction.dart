import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String uid;
  final double amount;
  final String transactionName;
  final String transactionType;
  final DateTime transactionDate;

  const TransactionEntity({
    required this.uid,
    required this.amount,
    required this.transactionName,
    required this.transactionType,
    required this.transactionDate,
  });

  @override
  List<Object?> get props {
    return [
      uid,
      amount,
      transactionName,
      transactionType,
      transactionDate
    ];
  }
}
