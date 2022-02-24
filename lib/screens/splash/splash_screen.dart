import 'dart:async';
import 'package:flutter/material.dart';

//!--Screen_Catat--//
class SplashScreen extends StatelessWidget {
  //--khai bao router--//
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: 125,
            height: 125,
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Colors.lightBlueAccent,
          child: Text(
            'TIKI - Luôn luôn vì bạn',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
        )
      ],
    ) // ProductCard(product: Product.products[0]),
        );
  }
}
