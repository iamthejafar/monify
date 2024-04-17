
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../../../comman/usecases/usecase.dart';
import '../repository/auth_repo.dart';

class LoginUseCase implements UseCase<dynamic,LoginParams> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future <UserCredential> call(LoginParams params) async {
    return await _repository.login(email: params.email, password: params.password);
  }
}


class LoginParams extends Equatable {
  String email;
  String password;

  LoginParams({required this.email,required this.password});

  @override
  List<Object?> get props => [email,password];
}