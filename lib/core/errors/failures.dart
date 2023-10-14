import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  const Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('bad Certificate with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');

      // case DioExceptionType.unknown:
      //   return ServerFailure('Unexpected Error, Please try again!');
      default:
        // if (dioException.message!.contains("Failed host lookup:")) {
        //   return ServerFailure('No Internet Connection');
        // }
        return ServerFailure('Opps There was an Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 403) {
      return ServerFailure("Error code is $statusCode"
          "!!TURN VPN ON!!");
    } else if (statusCode == 404) {
      return ServerFailure('Error code is $statusCode'
          'Page not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure("Error code is $statusCode"
          "Internal Server Error, Please try later!");
    } else if (statusCode == 501) {
      return ServerFailure('Error code is $statusCode'
          'Not Implemented, Please try later!');
    } else if (statusCode == 502) {
      return ServerFailure('Error code is $statusCode'
          'Bad Gateway, Please try later1');
    } else if (statusCode == 503) {
      return ServerFailure('Error code is $statusCode'
          'Service Unavailable, Please try later!');
    } else if (statusCode == 504) {
      return ServerFailure('Error code is $statusCode'
          'Gateway Timeout, Please try later!');
    } else {
      return ServerFailure('Error code is $statusCode'
          'Opps There was an Error, Please try again!');
    }
  }
}

class CacheFailure extends Failures {
  CacheFailure(super.errMessage);
}

class NetWorkFailure extends Failures {
  NetWorkFailure(super.errMessage);
}
