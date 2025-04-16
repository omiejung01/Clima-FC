import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:clima_flutter/services/weather.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});

  final dynamic locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();


}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = new WeatherModel();
  double temperature = 0.0;
  String cityName = '';
  String weatherIcon ='';
  String message = '';


  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(var weatherData) {
    temperature = weatherData['current']['temp_c'];
    int condition = weatherData['current']['condition']['code'];
    //weatherIcon = weather.getWeatherIcon(condition);
    print('condition: $condition');
    weatherIcon = "https:${weatherData['current']['condition']['icon']}";
    print('weatherIcon: $weatherIcon');
    cityName = weatherData['location']['name'];
    message = weather.getMessage(temperature.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withValues( alpha: 0.8) , BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature',
                      style: kTempTextStyle,
                    ),

                    Image.network(weatherIcon),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}