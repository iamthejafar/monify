
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../../../comman/error/failures.dart';
import '../../../../comman/usecases/usecase.dart';
import '../repository/auth_repo.dart';

class SignUpUseCase implements UseCase<dynamic,SignUpParams> {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  @override
  Future <UserCredential> call(SignUpParams params) async {
    return await _repository.signUp(email: params.email, password: params.password);
  }
}


class SignUpParams extends Equatable {
  String email;
  String password;

  SignUpParams({required this.email,required this.password});

  @override
  List<Object?> get props => [email,password];
}