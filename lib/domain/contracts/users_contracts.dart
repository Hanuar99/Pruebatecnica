import 'package:dartz/dartz.dart';
import 'package:prueba/domain/entities/user.dart';

import '../../core/error/exceptions.dart';

abstract class UsersContracts {
  Future<Either<GenericException, bool>> registerUser({required User user});
  Future<Either<GenericException, bool>> editarUser({required User user});
  Future<Either<GenericException, List<User>>> getUsers();
  Future<Either<GenericException, bool>> deleteUser({required String idUser});
}
