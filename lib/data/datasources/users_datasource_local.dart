import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba/data/models/user_model.dart';

import '../../domain/entities/user.dart';

abstract class UsersRemoteDataSourceContract {
  // Future<List<DeviceModel>> getDeviceLocal();
  Future<bool> registerUser({required User user});
  Future<bool> editarUser({required User user});
  Future<List<UserModel>> getUsers();
  Future<bool> deleteUser({required String idUser});
}

class UsersRemoteDataSource implements UsersRemoteDataSourceContract {
  final FirebaseFirestore firebase;

  UsersRemoteDataSource(this.firebase);

  @override
  Future<bool> registerUser({required User user}) async {
    final docUser = firebase.collection('users').doc();
    user.id = docUser.id;
    await docUser.set(user.toJson());
    return true;
  }

  @override
  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    final data = await firebase.collection('users').get();
    for (var element in data.docs) {
      users.add(UserModel.fromJson(element.data()));
    }
    return users;
  }

  @override
  Future<bool> deleteUser({required String idUser}) async {
    final docUser = firebase.collection('users').doc(idUser);
    await docUser.delete();
    return true;
  }

  @override
  Future<bool> editarUser({required User user}) async {
    final docUser = firebase.collection('users').doc(user.id);
    await docUser.update(user.toJson());
    return true;
  }
}
