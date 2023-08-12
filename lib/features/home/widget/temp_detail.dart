import 'package:flutter/material.dart';
import 'package:weather_app/features/home/widget/Small_card.dart';

class TemperateDetail extends StatelessWidget {
  final int temp;
  final int wind;
  final int humidity;
  const TemperateDetail(
      {Key? key,
      required this.temp,
      required this.wind,
      required this.humidity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SmallCard(title: 'Temp', value: temp, suffix: '°C'),
          SmallCard(title: 'Wind', value: wind, suffix: 'km/h'),
          SmallCard(title: 'Humidity', value: humidity, suffix: '%'),
        ],
      ),
    );
  }
}
