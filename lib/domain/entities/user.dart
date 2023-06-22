import 'package:equatable/equatable.dart';

class User extends Equatable {
  String id;
  final String firstName;
  final String lastName;
  final String fechaNacimiento;
  final List<String> directions;

  User({
    this.id = '',
    required this.firstName,
    required this.lastName,
    required this.fechaNacimiento,
    required this.directions,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fechaNacimiento': fechaNacimiento,
      'directions': directions,
    };
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        fechaNacimiento,
        directions,
      ];
}
