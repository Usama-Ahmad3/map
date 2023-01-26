import 'package:flutter/material.dart';
import 'package:world_explorer/details.dart';
import 'package:world_explorer/forgetpassword.dart';
import 'package:world_explorer/logIn.dart';
import 'package:world_explorer/map.dart';
import 'package:world_explorer/routes/routeName.dart';
import 'package:world_explorer/signUpPage.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.details:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Details());
      case RoutesName.forgetpassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Forget());
      case RoutesName.signUpPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SigUp());
      case RoutesName.logIn:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LogIn_page());
      case RoutesName.map:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MapScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No Route Defined')),
          );
        });
    }
  }
}
