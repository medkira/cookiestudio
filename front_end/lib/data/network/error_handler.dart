// ignore_for_file: constant_identifier_names

import 'package:cookiestudio/data/network/failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // # dio error so it's an error from response of the API or from dio itself.
      failure = _handleError(error);
    } else {
      // # default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.RECIVE_TIMEOUT.getFailure();

    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();

    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();

    case DioExceptionType.badResponse:
      if (exception.response != null &&
          exception.response?.statusCode != null &&
          exception.response?.statusMessage != null) {
        // ? return the exceptio "error " from the api itself in this case.
        return Failure(exception.response?.statusCode ?? 0,
            exception.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }

    default:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNEL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  UNKNOWN_ERROR,
  INVALID_DATA,
  INVALID_CREDENTIALS,
  DEFAULT
}

extension DataSourceExtention on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);

      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);

      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);

      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);

      case DataSource.UNAUTORISED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);

      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);

      case DataSource.INTERNEL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNEL_SERVER_ERROR,
            ResponseMessage.INTERNEL_SERVER_ERROR);

      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);

      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);

      case DataSource.RECIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIVE_TIMEOUT, ResponseMessage.RECIVE_TIMEOUT);

      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);

      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);

      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);

      case DataSource.UNKNOWN_ERROR:
        return Failure(
            ResponseCode.UNKNOWN_ERROR, ResponseMessage.UNKNOWN_ERROR);

      case DataSource.INVALID_DATA:
        return Failure(ResponseCode.INVALID_DATA, ResponseMessage.INVALID_DATA);

      case DataSource.INVALID_CREDENTIALS:
        return Failure(ResponseCode.INVALID_CREDENTIALS,
            ResponseMessage.INVALID_CREDENTIALS);

      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // ? API status code

  static const int SUCCESS = 200;
  static const int NO_CONTENT = 204;
  static const int BAD_REQUEST = 400;
  static const int FORBIDDEN = 403;
  static const int UNAUTORISED = 401;
  static const int NOT_FOUND = 404;
  static const int INTERNEL_SERVER_ERROR = 500;

// ? local status code
  static const int CONNECT_TIMEOUT = 504;
  static const int CANCEL = 499;
  static const int RECIVE_TIMEOUT = 502;
  static const int SEND_TIMEOUT = 503;
  static const int CACHE_ERROR = 501;
  static const int NO_INTERNET_CONNECTION = 505;

  static const int UNKNOWN_ERROR = 999;

  static const int INVALID_DATA = 1000;

  static const int INVALID_CREDENTIALS = 1001;
  // ? default
  static const int DEFAULT = 999;
}

class ResponseMessage {
  // ? API status message

  static const String SUCCESS = "success";
  static const String NO_CONTENT = "success";
  static const String BAD_REQUEST = "Bad request, try again later";
  static const String UNAUTORISED = "User is unaithorised, try again later";
  static const String FORBIDDEN = "Forbidden request, try again later";
  static const String NOT_FOUND = "Not found ";
  static const String INTERNEL_SERVER_ERROR = "Some thing went wrong";

// ? local status message
  static const String CONNECT_TIMEOUT = "Time out error, try again later";
  static const String CANCEL = "Request was cancelled,try again later";
  static const String RECIVE_TIMEOUT =
      "Recived time out  was cancelled,try again later";
  static const String SEND_TIMEOUT =
      "Send timeout was cancelled,try again later";
  static const String CACHE_ERROR = "Cache error try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connnection";

  static const String UNKNOWN_ERROR = "Some thing went wrong";

  static const String INVALID_DATA = "";

  static const String INVALID_CREDENTIALS = "";
  static const String DEFAULT = "Something went wrong";
}

class ApiInternalStatus {
  static const int SUCCESS = 1;
  static const int FAILURE = 0;
}
