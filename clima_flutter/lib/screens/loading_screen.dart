import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_flutter/screens/location_screen.dart';

const apiKey = '41b07f0fc1de48d7a7275005251504';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Location location = new Location();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    await location.getCurrentLocation();

    NetworkHelper networkHelper = new NetworkHelper('https://api.weatherapi.com/v1/current.json?key=$apiKey&q=${location.latitude},${location.longitude}');
    var weatherData = await networkHelper.getData();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        }));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.yellow[600],
          size: 50.0,
        ),
      ),
    );
  }
}