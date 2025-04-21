import 'package:flutter/material.dart';
import 'package:real_estate_app/route/route_constants.dart';

import '../ui/home/views/home_screen.dart';
import '../ui/map/views/map_screen.dart';

// Yuo will get 50+ screens and more once you have the full template
// 🔗 Full template: https://theflutterway.gumroad.com/l/fluttershop


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case realEstateMap:
      return MaterialPageRoute(
        builder: (context) => const MapScreen(),
      );
    default:
      return MaterialPageRoute(
        // Make a screen for undefine
        builder: (context) => const HomeScreen(),
      );
  }
}
