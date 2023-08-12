// ignore_for_file: unused_element, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_format/date_format.dart';
import 'package:weather_app/features/home/widget/current_day_forecast.dart';
import 'package:weather_app/features/home/widget/temp_detail.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? _currentAddress;

  String getCurrentDate() {
    var now = new DateTime.now();

    String formattedDate = formatDate(now, [dd, ' ', MM, ' ', yyyy]);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _handleLocationPermission() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location services are disabled. Please enable the services')));
        return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permissions are denied')));
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location permissions are permanently denied, we cannot request permissions.')));
        return false;
      }
      return true;
    }

    // get current location
    void getCurrentLocation() async {
      bool hasPermission = await _handleLocationPermission();

      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        debugPrint('location: ${position.latitude}');
        debugPrint('location: ${position.longitude}');

        setState(() {
          _currentAddress = "${position.latitude}, ${position.longitude}";
        });
      }).catchError((e) {
        debugPrint(e);
      });
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF090A36),
            Color(0xFF060620),
          ], begin: Alignment.topRight, end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            // location name
            Container(
              height: 200,
              margin: const EdgeInsets.only(top: 50),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vellore',
                        style: GoogleFonts.sacramento(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // !date
                      Text(
                        getCurrentDate(),
                        style: GoogleFonts.nunitoSans(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ]),
              ),
            ),
            // ! image
            Image.asset(
              'assets/images/sun/8.png',
              height: 250,
              width: 250,
            ),
            // ! details
            const TemperateDetail(temp: 30, wind: 10, humidity: 20),

            const CurrentDayForecast()
          ],
        ),
      ),
    );
  }
}
