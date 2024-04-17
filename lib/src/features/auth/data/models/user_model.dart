import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.about,
    required super.name,
    required super.email,
    required super.profilePicUrl,
    required super.totalBalance,
    required super.income,
    required super.expense,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot.id,
      about: data['about'],
      name: data['name'],
      email: data['email'],
      profilePicUrl: data['profilePicUrl'],
      totalBalance: data['totalBalance'],
      income: data['income'],
      expense: data['expense'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'about': about,
      'name': name,
      'email': email,
      'profilePicUrl': profilePicUrl,
      "totalBalance" : totalBalance,
      "income" : income,
      "expense" : expense
    };
  }

  UserModel copyWith({
    String? uid,
    String? about,
    String? name,
    String? email,
    String? profilePicUrl,
    double? totalBalance,
    double? income,
    double? expense,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      about: about ?? this.about,
      name: name ?? this.name,
      email: email ?? this.email,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      totalBalance: totalBalance ?? this.totalBalance,
      income: income ?? this.income,
      expense: expense ?? this.expense,
    );
  }
}

