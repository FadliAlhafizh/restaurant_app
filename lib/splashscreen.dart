import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app/page/list_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  static const routeName = '/splashscreen';

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return const RestaurantListPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          'https://islamic-education.uii.ac.id/wp-content/uploads/2018/01/dapur-rumahku-makanan-indonesia.png',
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
