
import 'package:equatable/equatable.dart';
import 'package:monify/src/features/auth/domain/entity/user.dart';


import '../../../../comman/usecases/usecase.dart';
import '../repository/auth_repo.dart';

class GetUserUseCase implements UseCase<dynamic,GetUserParams> {
  final AuthRepository _repository;

  GetUserUseCase(this._repository);

  @override
  Future <UserEntity> call(GetUserParams params) async {
    return await _repository.getUser(uid: params.uid,);
  }
}


class GetUserParams extends Equatable {
  String uid;

  GetUserParams({required this.uid});

  @override
  List<Object?> get props => [uid];
}