import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/car_model.dart';
import 'package:flutter_midterm/data/repository/car_helper.dart';

class EditCarScreen extends StatefulWidget {
  const EditCarScreen({Key? key}) : super(key: key);
  static const route = '/edit-car';

  @override
  _EditCarScreenState createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCarScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController brand = TextEditingController();
  late TextEditingController model = TextEditingController();
  late TextEditingController imageUrl = TextEditingController();
  late TextEditingController year = TextEditingController();
  late TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map arguments = (ModalRoute.of(context)!.settings.arguments as Map);
    Car carData = arguments['car'];
    int index = arguments['index'];
    int id = carData.id;

    brand = TextEditingController(text: carData.brand);
    model = TextEditingController(text: carData.model);
    imageUrl = TextEditingController(text: carData.imageUrl);
    year = TextEditingController(text: carData.year.toString());
    description = TextEditingController(text: carData.description);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Car'),
          centerTitle: true,
          backgroundColor: Colors.pink,
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
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 30,
              right: 20,
              bottom: 30,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          right: 0,
                          bottom: 10,
                        ),
                        child: Card(
                          child: TextFormField(
                            controller: brand,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              hintText: 'enter car brand',
                            ),
                            validator: (userInput) {
                              if (userInput == null || userInput.isEmpty) {
                                return 'wrong value provided';
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          right: 0,
                          bottom: 10,
                        ),
                        child: Card(
                          child: TextFormField(
                            controller: model,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              hintText: 'enter car model',
                            ),
                            validator: (userInput) {
                              if (userInput == null || userInput.isEmpty) {
                                return "wrong value provided";
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          right: 0,
                          bottom: 10,
                        ),
                        child: Card(
                          child: TextFormField(
                            controller: imageUrl,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              hintText: 'enter image url',
                            ),
                            validator: (userInput) {
                              if (userInput == null || userInput.isEmpty) {
                                return "wrong url provided";
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          right: 0,
                          bottom: 10,
                        ),
                        child: Card(
                          child: TextFormField(
                            controller: year,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              hintText: 'enter car year',
                            ),
                            validator: (userInput) {
                              if (userInput == null || userInput.isEmpty) {
                                return "wrong value provided";
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          right: 0,
                          bottom: 10,
                        ),
                        child: Card(
                          child: TextFormField(
                            controller: description,
                            decoration: const InputDecoration(
                                hintText: 'enter description',
                                contentPadding: EdgeInsets.all(20.0)),
                            validator: (userInput) {
                              if (userInput == null || userInput.isEmpty) {
                                return "wrong value provided";
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          right: 50,
                        ),
                        child: ElevatedButton(
                          child: const Text('Back'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      ElevatedButton(
                        child: const Text('Edit Car'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Car newCar = Car(
                              imageUrl: imageUrl.text,
                              id: id,
                              brand: brand.text,
                              model: model.text,
                              year: int.parse(year.text),
                              description: description.text,
                            );
                            CarHelper().editCar(newCar, index);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
