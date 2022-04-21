import 'package:flutter/material.dart';
import 'package:gonna_do/Source/View/HomePage/landscape_home.dart';
import 'package:gonna_do/Source/View/HomePage/portrait_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => (orientation == Orientation.portrait)
          ? PortraitHome()
          : const LandscapeHome(),
    );
  }
}
