import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          imagePath:
              "https://m.media-amazon.com/images/I/715Sr0EKR5L._AC_UF1000,1000_QL80_.jpg",
          pincode: 143001),
      CityModel(
          id: 2,
          cityName: "Ludhiana",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/a/a9/Ludhiana_city.jpg",
          pincode: 141001),
      CityModel(
          id: 3,
          cityName: "Jalandhar",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/4/47/Jalandhar_City.jpg",
          pincode: 144001),
      CityModel(
          id: 4,
          cityName: "Patiala",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/1/13/Patiala_Quila_Mubarak.jpg",
          pincode: 147001),
      CityModel(
          id: 5,
          cityName: "Bathinda",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/2/25/Qila_Mubarak_Bathinda.jpg",
          pincode: 151001),
      CityModel(
          id: 6,
          cityName: "Mohali",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/6/6b/Mohali_IT_Park.jpg",
          pincode: 160062),
      CityModel(
          id: 7,
          cityName: "Hoshiarpur",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/5/5c/Hoshiarpur_town.jpg",
          pincode: 146001),
      CityModel(
          id: 8,
          cityName: "Pathankot",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/6/67/Pathankot_city.jpg",
          pincode: 145001),
      CityModel(
          id: 9,
          cityName: "Moga",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/3/35/Moga_City_Punjab.jpg",
          pincode: 142001),
      CityModel(
          id: 10,
          cityName: "Ferozepur",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/4/48/Ferozepur_Border.jpg",
          pincode: 152001),
      CityModel(
          id: 11,
          cityName: "Sangrur",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/d/d9/Sangrur_Town.jpg",
          pincode: 148001),
      CityModel(
          id: 12,
          cityName: "Gurdaspur",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/7/7a/Gurdaspur_City.jpg",
          pincode: 143521),
      CityModel(
          id: 13,
          cityName: "Fazilka",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/1/17/Fazilka_Punjab.jpg",
          pincode: 152123),
      CityModel(
          id: 14,
          cityName: "Kapurthala",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/6/61/Kapurthala_Punjab.jpg",
          pincode: 144601),
      CityModel(
          id: 15,
          cityName: "Barnala",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/2/22/Barnala_Punjab.jpg",
          pincode: 148101),
      CityModel(
          id: 16,
          cityName: "Tarn Taran",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/9/91/Tarn_Taran_Sahib.jpg",
          pincode: 143401),
      CityModel(
          id: 17,
          cityName: "Rupnagar",
          imagePath:
              "https://upload.wikimedia.org/wikipedia/commons/c/c4/Rupnagar_City.jpg",
          pincode: 140001),
    ]);
  }
}
