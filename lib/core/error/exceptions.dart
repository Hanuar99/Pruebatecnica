abstract class GenericException implements Exception {
  final String message;

  GenericException(this.message);
}

class FirestoreGetUsersException extends GenericException {
  FirestoreGetUsersException(String message) : super(message);
}

class FirestoreRegisterException extends GenericException {
  FirestoreRegisterException(String message) : super(message);
}

class FirestoreReadException extends GenericException {
  FirestoreReadException(String message) : super(message);
}

class FirestoreDeleteUsersException extends GenericException {
  FirestoreDeleteUsersException(String message) : super(message);
}

class FirestoreUpdateException extends GenericException {
  FirestoreUpdateException(String message) : super(message);
}

class NoInternetConnectionException extends GenericException {
  NoInternetConnectionException(String message) : super(message);
}
