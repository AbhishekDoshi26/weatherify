import 'package:flutter/material.dart';
import 'package:weatherify/services/location.dart';
import 'package:weatherify/services/networking.dart';

const apiKey = '4f84e44072e242ae76f0bd24b93067a3';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

//var temperature = decodedData['main']['temp'];
//var condition = decodedData['weather'][0]['id'];
//var cityName = decodedData['name'];
