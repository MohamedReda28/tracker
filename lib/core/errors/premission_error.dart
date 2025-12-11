class CheckAndRequestLocationServiceException implements Exception {
  final String message;

  CheckAndRequestLocationServiceException({required this.message});

  String toString() {
    return message;
  }
}

class CheckAndRequestPermissionLocationException implements Exception {
  final String message;

  CheckAndRequestPermissionLocationException({required this.message});

  String toString() {
    return message;
  }
}
