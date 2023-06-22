import 'package:prueba/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    String? id,
    String? firstName,
    String? lastName,
    String? fechaNacimiento,
    List<String>? directions,
  }) : super(
          id: id!,
          firstName: firstName!,
          lastName: lastName!,
          fechaNacimiento: fechaNacimiento!,
          directions: directions!,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? '',
      firstName: json["firstName"] ?? '',
      lastName: json["lastName"] ?? '',
      fechaNacimiento: json["fechaNacimiento"] ?? '',
      directions: List<String>.from(json["directions"].map((x) => x)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'dob': fechaNacimiento,
      'addresses': directions,
    };
  }
}
