import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/dummy_data.dart';
import 'package:flutter_midterm/data/models/car_model.dart';
import 'package:flutter_midterm/presentation/widgets/list_item.dart';

import 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Car> carsList = DUMMY_DATA;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cars'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                AddCarScreen.route,
                arguments: {
                  "id": carsList[carsList.length - 1].id + 1,
                },
              ).then((value) => setState(() {}));
            },
          ),
        ],
      ),
      body: Container(
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.black],
          ),
          shape: ContinuousRectangleBorder(),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final car = carsList[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                CarDetailedPage.route,
                arguments: {
                  "car": carsList[index],
                },
              ).then(
                (value) => setState(() {}),
              ),
              onLongPress: () => Navigator.pushNamed(
                context,
                EditCarScreen.route,
                arguments: {
                  "car": carsList[index],
                  "index": index,
                },
              ).then(
                (value) => setState(() {}),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 15,
                  right: 10,
                  left: 10,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink,
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListItem(
                    name: car.brand + ' ' + car.model,
                    imageUrl: car.imageUrl,
                    year: car.year,
                    index: index,
                  ),
                ),
              ),
            );
          },
          itemCount: carsList.length,
        ),
      ),
    );
  }
}
