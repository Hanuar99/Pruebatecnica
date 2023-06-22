import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/domain/entities/user.dart';
import 'package:prueba/domain/usecases/delete_user.dart';
import 'package:prueba/domain/usecases/editar_user.dart';
import 'package:prueba/domain/usecases/get_users.dart';
import 'package:prueba/domain/usecases/register_user.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final RegisterUser registerUser;
  final GetUsers getUsers;
  final DeleteUser deleteUser;
  final EditarUser editarUser;
  UsersBloc({
    required this.registerUser,
    required this.getUsers,
    required this.deleteUser,
    required this.editarUser,
  }) : super(const UsersState(users: [])) {
    on<GetUsersEvent>((event, emit) async {
      emit(state.copyWith(getUsersStatus: GetUsersStatus.loading));
      final usersOrFailure = await getUsers();
      usersOrFailure.fold(
          (l) => emit(state.copyWith(
              getUsersStatus: GetUsersStatus.error, errorMessage: l.message)),
          (r) => emit(state.copyWith(
              users: r, getUsersStatus: GetUsersStatus.loadSuccess)));
    });
    on<RegisterUserEvent>((event, emit) async {
      emit(state.copyWith(registerUserStatus: RegisterUserStatus.loading));
      final registerOrFailure = await registerUser(user: event.user);
      registerOrFailure.fold(
          (l) => {
                print('error al registrar'),
                emit(state.copyWith(
                    registerUserStatus: RegisterUserStatus.error,
                    errorMessage: l.message))
              },
          (r) => emit(state.copyWith(
              registerUserStatus: RegisterUserStatus.loadSuccess)));
      emit(state.copyWith(registerUserStatus: RegisterUserStatus.idle));
    });

    on<DeleteUsersEvent>(
      (event, emit) async {
        emit(state.copyWith(deleteUserStatus: DeleteUserStatus.loading));
        final deleteOrFailure = await deleteUser(idUser: event.idUser);
        deleteOrFailure.fold(
            (l) => emit(state.copyWith(
                deleteUserStatus: DeleteUserStatus.error,
                errorMessage: l.message)),
            (r) => emit(state.copyWith(
                deleteUserStatus: DeleteUserStatus.loadSuccess)));
        emit(state.copyWith(deleteUserStatus: DeleteUserStatus.idle));
      },
    );

    on<EditarUserEvent>(
      (event, emit) async {
        emit(state.copyWith(editUserStatus: EditUserStatus.loading));
        final editOrFailure = await editarUser(user: event.user);
        editOrFailure.fold(
            (l) => emit(state.copyWith(
                editUserStatus: EditUserStatus.error, errorMessage: l.message)),
            (r) => emit(
                state.copyWith(editUserStatus: EditUserStatus.loadSuccess)));
        emit(state.copyWith(editUserStatus: EditUserStatus.idle));
      },
    );
  }
}
