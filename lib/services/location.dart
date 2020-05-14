import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      var location = loc.Location();
      bool enabled = await location.serviceEnabled();
      print(enabled);
      if (enabled == false) await location.requestService();
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
