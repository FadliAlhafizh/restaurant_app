import 'package:flutter/material.dart';
import 'package:restaurant_app/page/detail_page.dart';
import 'package:restaurant_app/page/list_page.dart';
import 'package:restaurant_app/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      initialRoute: SplashScreenPage.routeName,
      routes: {
        SplashScreenPage.routeName: (context) => const SplashScreenPage(),
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        RestoDetailPage.routeName: (context) => RestoDetailPage(
          resto: ModalRoute.of(context)?.settings.arguments as dynamic,
        ),
      },
    );
  }
}
