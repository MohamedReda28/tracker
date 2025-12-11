abstract class Failur {
  final String message;

  Failur(this.message);
}

class LocationServerFailure extends Failur {
  LocationServerFailure(super.message);
}

class NetworkFailure extends Failur {
  NetworkFailure(super.message);
}