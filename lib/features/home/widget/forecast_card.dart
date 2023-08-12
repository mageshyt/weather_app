import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.model.dart';

class ForecastCard extends StatelessWidget {
  final WeatherForecast forecastData;

  const ForecastCard({Key? key, required this.forecastData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String icon = forecastData.getWeatherIcon();
    print(icon);
    return Container(
      width: 140,
      height: 80,
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xFF11112B),
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // image
        Image(
          image: AssetImage(icon),
          height: 50,
          width: 50,
        ),
        // time and temp

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '12:00',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${forecastData.tempetature} °C',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
