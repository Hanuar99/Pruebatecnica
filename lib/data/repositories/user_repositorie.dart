import 'package:dartz/dartz.dart';
import 'package:prueba/core/error/exceptions.dart';
import 'package:prueba/core/network/network_info.dart';
import 'package:prueba/data/datasources/users_datasource_remote.dart';
import 'package:prueba/domain/contracts/users_contracts.dart';
import 'package:prueba/domain/entities/user.dart';

class UsersRepository implements UsersContracts {
  final UsersRemoteDataSourceContract usersLocalDataSourceContract;
  final NetworkInfo networkInfo;

  UsersRepository({
    required this.networkInfo,
    required this.usersLocalDataSourceContract,
  });

  @override
  Future<Either<GenericException, bool>> registerUser(
      {required User user}) async {
    if (await networkInfo.isConnected) {
      try {
        await usersLocalDataSourceContract.registerUser(user: user);
        return const Right(true);
      } catch (_) {
        return Left(FirestoreRegisterException('Error al registrar usuario'));
      }
    } else {
      return left(NoInternetConnectionException('Sin conexion a internet'));
    }
  }

  @override
  Future<Either<GenericException, List<User>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final users = await usersLocalDataSourceContract.getUsers();
        return Right(users);
      } catch (_) {
        return Left(FirestoreGetUsersException('Error al obtener usuarios'));
      }
    } else {
      return left(NoInternetConnectionException('Sin conexion a internet'));
    }
  }

  @override
  Future<Either<GenericException, bool>> deleteUser(
      {required String idUser}) async {
    if (await networkInfo.isConnected) {
      try {
        await usersLocalDataSourceContract.deleteUser(idUser: idUser);
        return const Right(true);
      } catch (_) {
        return Left(FirestoreDeleteUsersException('Error al eliminar usuario'));
      }
    } else {
      return left(NoInternetConnectionException('Sin conexion a internet'));
    }
  }

  @override
  Future<Either<GenericException, bool>> editarUser(
      {required User user}) async {
    if (await networkInfo.isConnected) {
      try {
        await usersLocalDataSourceContract.editarUser(user: user);
        return const Right(true);
      } catch (_) {
        return Left(FirestoreUpdateException('Error al actualizar usuario'));
      }
    } else {
      return left(NoInternetConnectionException('Sin conexion a internet'));
    }
  }
}
