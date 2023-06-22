import 'package:dartz/dartz.dart';
import 'package:prueba/core/error/exceptions.dart';
import 'package:prueba/domain/contracts/users_contracts.dart';
import 'package:prueba/domain/entities/user.dart';

class EditarUser {
  final UsersContracts usersContracts;

  EditarUser(this.usersContracts);

  Future<Either<GenericException, bool>> call({required User user}) {
    return usersContracts.editarUser(user: user);
  }
}
