import 'package:flutter/material.dart';
import 'package:weather_app/features/home/widget/forecast_card.dart';
import 'package:weather_app/models/weather_forecast.model.dart';

class CurrentDayForecast extends StatelessWidget {
  const CurrentDayForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: Column(
        children: [
          // heading

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Today',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'View full report',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            )
          ]),

          //   forecast card
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...WeatherForecast.dummyDate
                    .map((e) => ForecastCard(forecastData: e))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
