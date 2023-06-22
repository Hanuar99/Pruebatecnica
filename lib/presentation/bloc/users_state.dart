part of 'users_bloc.dart';

enum GetUsersStatus { idle, loading, loadSuccess, error }

enum RegisterUserStatus { idle, loading, loadSuccess, error }

enum DeleteUserStatus { idle, loading, loadSuccess, error }

enum EditUserStatus { idle, loading, loadSuccess, error }

class UsersState extends Equatable {
  final List<User>? users;
  final GetUsersStatus getUsersStatus;
  final RegisterUserStatus registerUserStatus;
  final DeleteUserStatus deleteUserStatus;
  final EditUserStatus editUserStatus;
  final String errorMessage;
  const UsersState({
    this.users,
    this.getUsersStatus = GetUsersStatus.idle,
    this.registerUserStatus = RegisterUserStatus.idle,
    this.deleteUserStatus = DeleteUserStatus.idle,
    this.editUserStatus = EditUserStatus.idle,
    this.errorMessage = '',
  });
  UsersState copyWith({
    List<User>? users,
    GetUsersStatus? getUsersStatus,
    RegisterUserStatus? registerUserStatus,
    DeleteUserStatus? deleteUserStatus,
    EditUserStatus? editUserStatus,
    String? errorMessage,
  }) {
    return UsersState(
      users: users ?? this.users,
      getUsersStatus: getUsersStatus ?? this.getUsersStatus,
      registerUserStatus: registerUserStatus ?? this.registerUserStatus,
      deleteUserStatus: deleteUserStatus ?? this.deleteUserStatus,
      editUserStatus: editUserStatus ?? this.editUserStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        users,
        getUsersStatus,
        registerUserStatus,
        deleteUserStatus,
        editUserStatus,
        errorMessage,
      ];
}
