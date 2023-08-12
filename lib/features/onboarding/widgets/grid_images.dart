import 'package:flutter/material.dart';
import 'package:weather_app/constans/assets_constants.dart';

class GridImages extends StatelessWidget {
  const GridImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              height: 140,
              width: 140,
              child: Image.asset(
                AssetsConstants.snow_image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 200,
            child: Container(
              height: 140,
              width: 140,
              child: Image.asset(
                AssetsConstants.moon_image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 20,
            child: Container(
              height: 140,
              width: 140,
              child: Image.asset(
                AssetsConstants.sun_image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 340,
            left: 200,
            child: Container(
              height: 140,
              width: 140,
              child: Image.asset(
                AssetsConstants.cloud_image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
