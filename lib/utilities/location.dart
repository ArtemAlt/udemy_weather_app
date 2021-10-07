import 'package:geolocator/geolocator.dart';
import 'dart:developer';

import 'locator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // await Geolocator.getCurrentPosition(
      //     desiredAccuracy: LocationAccuracy.low)
      //     .timeout(const Duration(seconds: 15));
      latitude = position.latitude;
      longitude = position.longitude;
      log("Getting current location $latitude $longitude");
    } catch (e) {
      throw "Could not get current location " + e.toString();
    }
  }
}
