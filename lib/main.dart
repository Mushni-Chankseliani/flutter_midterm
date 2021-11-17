import 'package:flutter/material.dart';
import 'presentation/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.route: (context) => const HomeScreen(),
        AddCarScreen.route: (context) => const AddCarScreen(),
        EditCarScreen.route: (context) => const EditCarScreen(),
        CarDetailedPage.route: (context) => const CarDetailedPage(),
      },
    );
  }
}
