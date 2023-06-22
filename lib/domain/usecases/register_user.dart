import 'package:dartz/dartz.dart';
import 'package:prueba/core/error/exceptions.dart';
import 'package:prueba/domain/contracts/users_contracts.dart';
import 'package:prueba/domain/entities/user.dart';

class RegisterUser {
  final UsersContracts usersContracts;

  RegisterUser(this.usersContracts);

  Future<Either<GenericException, bool>> call({required User user}) {
    return usersContracts.registerUser(user: user);
  }
}
