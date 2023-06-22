part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends UsersEvent {
  final User user;

  const RegisterUserEvent({required this.user});
}

class GetUsersEvent extends UsersEvent {}

class DeleteUsersEvent extends UsersEvent {
  final String idUser;

  const DeleteUsersEvent(this.idUser);
}

class EditarUserEvent extends UsersEvent {
  final User user;

  const EditarUserEvent({required this.user});
}
