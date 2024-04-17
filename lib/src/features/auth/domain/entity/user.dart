import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{

  final String uid;
  final String about;
  final String name;
  final String email;
  final String profilePicUrl;
  final double totalBalance;
  final double income;
  final double expense;



  const UserEntity({
    required this.uid,
    required this.about,
    required this.name,
    required this.email,
    required this.profilePicUrl,
    required this.totalBalance,
    required this.income,
    required this.expense,
  });

  @override
  List < Object ? > get props {
    return [
      uid,
      about,
      name,
      email,
      profilePicUrl,
      totalBalance,
      income,
      expense
    ];
  }
}