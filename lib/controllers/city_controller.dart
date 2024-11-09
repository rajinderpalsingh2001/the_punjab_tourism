import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:the_punjab_tourism/models/city_model.dart';

class CityController extends GetxController {
  TextEditingController searchCityNameController = TextEditingController();

  List<CityModel> allCities = [];

  @override
  void onInit() {
    super.onInit();
    allCities.addAll([
      CityModel(
          id: 1,
          cityName: "Amritsar",
          latitude: 31.630886852998035, longitude: 74.87560862349407,
          imagePath:
              "assets/Amritsar/golden_temple_outro.jpg",
              isAssetImage: true,
          pincode: 143001),
      CityModel(
          id: 2,
          cityName: "Chandigarh",
          latitude: 30.73520546617692, longitude: 76.77688852611628,
          imagePath:
              "assets/chandigarh/handmonument_outro.jpg",
              isAssetImage: true,
          pincode: 143001),
      CityModel(
          id: 3,
          cityName: "Patiala",
          isAssetImage: true,
          latitude: 30.337444141863468, longitude: 76.38501635625401,
          imagePath:
              "assets/patiala/Patiala_outro.jpg",
          pincode: 147001),
      CityModel(
          id: 4,
          cityName: "Anandpur Sahib",
          isAssetImage: true,
          latitude: 31.235619854948794, longitude: 76.50155656531467,
          imagePath:
              "assets/anandpursahib/virasat-e-khalsa-outro.jpg",
          pincode: 144401),
    ]);
  }

  String getHeroTag({required CityModel city}) {
    return "${city.id}-${city.cityName}";
  }

    Future launchMap({required CityModel city}) async {
    if (await MapLauncher.isMapAvailable(MapType.google) == true) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(city.latitude, city.longitude),
        title: city.cityName, 
      );
    }
  }

}
