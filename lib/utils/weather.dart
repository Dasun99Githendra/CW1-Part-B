import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:simple_weather/credentials.dart';
import 'package:simple_weather/utils/location.dart';

class WeatherDisplayData {
  AssetImage weatherImage;

  WeatherDisplayData({@required this.weatherImage});
}

class WeatherData {
  WeatherData({@required this.locationData});

  LocationHelper locationData;
  double currentTemperature;
  int currentCondition;

  Future<void> getCurrentTemperature() async {
    Response response = await get(
        'http://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric');

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
      } catch (e) {
        print(e);
      }
    } else {
      print('Could not fetch temperature!');
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition < 600) {
      return WeatherDisplayData(
        weatherImage: AssetImage('assets/cloudy.jpg'),
      );
    } else {
      var now = new DateTime.now();

      if (now.hour >= 15) {
        return WeatherDisplayData(
          weatherImage: AssetImage('assets/night.jpg'),
        );
      } else {
        return WeatherDisplayData(
          weatherImage: AssetImage('assets/sunny.jpg'),
        );
      }
    }
  }
}