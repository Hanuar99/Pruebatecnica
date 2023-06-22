import 'package:dartz/dartz.dart';
import 'package:prueba/core/error/exceptions.dart';
import 'package:prueba/domain/contracts/users_contracts.dart';

import '../entities/user.dart';

class GetUsers {
  final UsersContracts usersContracts;

  GetUsers(this.usersContracts);

  Future<Either<GenericException, List<User>>> call() {
    return usersContracts.getUsers();
  }
}
