import 'package:flutter/material.dart';
import 'package:world_explorer/routes/routeName.dart';
import 'package:world_explorer/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.logIn,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
