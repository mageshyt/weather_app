import 'package:flutter/material.dart';
import 'package:weather_app/features/home/view/home_view.dart';
import 'package:weather_app/features/onboarding/view/onboarding_view.dart';
import 'package:weather_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isnewLogin = false;

  void setLogin() {
    print('setLogin');
    setState(() {
      isnewLogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: !isnewLogin
          ? OnboardingView(
              onGetStartedTap: setLogin,
            )
          : HomeView(),
    );
  }
}
