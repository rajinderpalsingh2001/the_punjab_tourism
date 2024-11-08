import 'package:get/get.dart';
import 'package:the_punjab_tourism/controllers/city_controller.dart';
import 'package:the_punjab_tourism/controllers/place_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CityController>(CityController());
    Get.put<PlaceController>(PlaceController());
  }
}
