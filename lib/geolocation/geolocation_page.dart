import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/geolocation/use_geolocation.dart';

class GeolocationPage extends HookWidget {
  const GeolocationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPosition = useGeolocation();
    return Scaffold(
      body: Center(
        child: Text(
            "Lat: ${currentPosition.latitude} Lng: ${currentPosition.longitude}"),
      ),
    );
  }
}
