class AppException implements Exception {
  final String message;
  AppException({required this.message});
}

class BadRequestException extends AppException {
  BadRequestException({required super.message});
}

class FetchDataException extends AppException {
  FetchDataException({required super.message});
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException({required super.message});
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({required super.message});
}
