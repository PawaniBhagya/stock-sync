import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_sync/screens/Home.dart'; // Update with your main screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 20), () {});
    Get.off(() => Home()); // Navigate to the main screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'), // Update with your logo path
      ),
    );
  }
}