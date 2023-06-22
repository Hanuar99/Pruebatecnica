import 'package:dartz/dartz.dart';
import 'package:prueba/core/error/exceptions.dart';
import 'package:prueba/domain/contracts/users_contracts.dart';

class DeleteUser {
  final UsersContracts usersContracts;

  DeleteUser(this.usersContracts);

  Future<Either<GenericException, bool>> call({required String idUser}) {
    return usersContracts.deleteUser(idUser: idUser);
  }
}
