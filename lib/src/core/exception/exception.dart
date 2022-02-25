import 'package:equatable/equatable.dart';

import 'api_exception.dart';

class BaseException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class NetworkException extends BaseException {
  @override
  String toString() {
    return 'Check your network';
  }
}

class ServerException extends BaseException {
  final dynamic _error;
  ServerException(this._error);

  @override
  String toString() {
    return _error.toString();
  }

  @override
  List<Object?> get props => [_error];
}

class ApiDowntimeException extends BaseException {
  final dynamic response;

  ApiDowntimeException(this.response);

  @override
  List<Object> get props => [response];
}

class CacheException extends BaseException {}

class UnknownException extends BaseException {}

class UserDataNotFoundException extends BaseException {}

class UnauthorizedException extends BaseException {
  final dynamic response;

  UnauthorizedException(this.response);

  @override
  List<Object> get props => [response];
}

class HttpException extends BaseException {
  final dynamic response;
  final String? errorMsg;
  final int? errorCode;
  final ApiException? apiException;

  HttpException.apiException(
      {required this.apiException, this.response, this.errorCode, this.errorMsg});

  HttpException.serverException(this.errorMsg, this.response,
      {this.errorCode, this.apiException});

  HttpException({this.response, this.errorCode, this.errorMsg, this.apiException});

  @override
  String toString() {
    return errorMsg ?? response.toString();
  }

  @override
  List<Object?> get props => [response, errorMsg, errorCode, apiException];
}

class ParsingException extends BaseException {}

class EmptyUserOrProductException extends BaseException {}

class ExpiredTokenException extends BaseException {
  final dynamic response;

  ExpiredTokenException(this.response);

  @override
  List<Object> get props => [response];
}

class FetchLocalUserDataException extends BaseException {}
