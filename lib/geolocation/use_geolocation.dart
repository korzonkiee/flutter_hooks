import 'dart:async';
import "package:flutter_hooks/flutter_hooks.dart";
import 'package:geolocator/geolocator.dart';

final initialPosition = Position(latitude: 0, longitude: 0);

Position useGeolocation() {
  final result = useState<Position>(initialPosition);

  useEffect(() {
    print("Subscribing for position stream.");

    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    StreamSubscription<Position> positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position _position) {
      result.value = _position;
    });

    return () {
      print("Disposing position stream.");
      positionStream.cancel();
    };
  }, []);

  useValueChanged(result.value, (_, __) {
    print(
        "Location changed to: ${result.value.latitude}, ${result.value.longitude}");
  });

  return result.value;
}
