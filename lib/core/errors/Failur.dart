import 'package:dio/dio.dart';

class Failur {
  final String errMassege;

  Failur({required this.errMassege});
}

class LocationServerFailure extends Failur {
  LocationServerFailure({required super.errMassege});

  factory LocationServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return LocationServerFailure(errMassege: 'Connction time outTime with api');
      case DioExceptionType.sendTimeout:
        return LocationServerFailure(errMassege: 'Send messege fail with api');
      case DioExceptionType.receiveTimeout:
        return LocationServerFailure(errMassege: 'Receive messege fail with api');
      case DioExceptionType.badCertificate:
        return LocationServerFailure(errMassege: 'Bad certificate received');
      case DioExceptionType.badResponse:
        return LocationServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return LocationServerFailure(
            errMassege: 'the reust was cancelled ,please try again!');
      case DioExceptionType.connectionError:
        return LocationServerFailure(
            errMassege: 'the internet connection fail,please try again!');
      case DioExceptionType.unknown:
        return LocationServerFailure(errMassege: 'Unexpected error ,please try again!');
      default:
        return LocationServerFailure(
            errMassege: 'Oops ther was an error ,please try again!');
    }
  }

  factory LocationServerFailure.fromResponse(
      int satatusCode, Map<String, dynamic> responsData) {
    if (satatusCode == 400 || satatusCode == 401 || satatusCode == 403) {
      return LocationServerFailure(errMassege: responsData['status']);
    } else if (satatusCode == 404) {
      return LocationServerFailure(
          errMassege: 'You requst not found,please try later!');
    } else if (satatusCode == 500) {
      return LocationServerFailure(
          errMassege: 'the Server has an error ,please try later!');
    } else {
      return LocationServerFailure(errMassege: 'Unexpected error ,please try again!');
    }
  }
}




class NetworkFailure extends Failur {
  NetworkFailure( {required super.errMassege});
}