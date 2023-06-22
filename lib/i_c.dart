import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:prueba/core/network/network_info.dart';
import 'package:prueba/domain/usecases/delete_user.dart';
import 'package:prueba/domain/usecases/editar_user.dart';
import 'package:prueba/domain/usecases/get_users.dart';
import 'package:prueba/domain/usecases/register_user.dart';
import 'package:prueba/presentation/bloc/users_bloc.dart';

import 'data/datasources/users_datasource_local.dart';
import 'data/repositories/user_repositorie.dart';
import 'domain/contracts/users_contracts.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => UsersBloc(
      registerUser: sl(), getUsers: sl(), deleteUser: sl(), editarUser: sl()));
  // Use Cases

  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));
  sl.registerLazySingleton(() => EditarUser(sl()));

  // Contracts
  sl.registerLazySingleton<UsersContracts>(() => UsersRepository(
        networkInfo: sl(),
        usersLocalDataSourceContract: sl(),
      ));

// Data sources local
  sl.registerLazySingleton<UsersRemoteDataSourceContract>(
      () => UsersRemoteDataSource(sl()));
// Data sources Bluetooth

// Data sources Socket

// Data sources remote

  // External

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
