import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/car_model.dart';
import 'package:flutter_midterm/data/repository/car_helper.dart';

class CarDetailedPage extends StatelessWidget {
  const CarDetailedPage({Key? key}) : super(key: key);
  static const route = '/detailed';

  @override
  Widget build(BuildContext context) {
    Map arguments = (ModalRoute.of(context)!.settings.arguments as Map);
    Car carData = arguments['car'];

    return Scaffold(
      appBar: AppBar(
        title: Text(carData.brand + ' ' + carData.model),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Delete this car?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        CarHelper().deleteCar(carData.id);
                        Navigator.pop(context, true);
                      },
                      child: const Text('Delete'),
                    )
                  ],
                ),
              ).then((param) {
                if (param) {
                  Navigator.pop(context);
                }
              });
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
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 30,
                right: 20,
                bottom: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      // left: 20,
                      // top: 30,
                      // right: 20,
                      bottom: 30,
                    ),
                    child: FadeInImage(
                      placeholder: const AssetImage(
                        'assets/images/car_placeholder.png',
                      ),
                      image: NetworkImage(carData.imageUrl),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 30,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Brand:',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              carData.brand,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Model:',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              carData.model,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Year:',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              carData.year.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Row(
                        //   children: [
                        //     Column(
                        // children: [
                        const Center(
                          child: Text(
                            'Description:',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(1),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    carData.description,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
