import 'package:flutter_midterm/data/dummy_data.dart';
import 'package:flutter_midterm/data/models/car_model.dart';

class CarHelper {
  void addCar(Car car) {
    DUMMY_DATA.add(car);
  }

  void deleteCar(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, {car});
  }
}
