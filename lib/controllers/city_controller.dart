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
          cityName: "Chandigarh",
          imagePath:
              "https://next57.com/wp-content/uploads/2024/06/b8f7e3efd3386de8d1cfb6c73af2f1e2.jpg",
          pincode: 143001),
      CityModel(
          id: 3,
          cityName: "Patiala",
          imagePath:
              "https://cdn.tripuntold.com/media/photos/location/2018/10/13/a651974d-cd55-4135-ada5-64cec41130ac.jpg",
          pincode: 147001),
      CityModel(
          id: 4,
          cityName: "Anandpur Sahib",
          imagePath:
              "https://www.thatgoangirl.com/wp-content/uploads/2023/02/things-to-do-in-anandpur-sahib.jpg",
          pincode: 144401),
      CityModel(
          id: 5,
          cityName: "Kapurthala",
          imagePath:
              "https://travelsetu.com/apps/uploads/new_destinations_photos/destination/2024/01/08/88ce9e17d3ccb3fae260451912f6a157_1000x1000.jpg",
          pincode: 144601),
      CityModel(
          id: 6,
          cityName: "Jalandhar",
          imagePath:
              "https://www.tourismpunjabindia.com/upload/Jalandhar/Devi_Talab_Mandir_Jalandhar.jpg",
          pincode: 144001),
      CityModel(
          id: 7,
          cityName: "Bathinda",
          imagePath:
              "https://www.tourismpunjabindia.com/upload/Bathinda/Qila_Mubarak_Bathinda.jpg",
          pincode: 151001),
      CityModel(
          id: 8,
          cityName: "Hoshiarpur",
          imagePath:
              "https://www.tourismpunjabindia.com/upload/Hoshiarpur/Ranjit_Sagar_Dam_Hoshiarpur.jpg",
          pincode: 146001),
      CityModel(
          id: 9,
          cityName: "Ropar",
          imagePath:
              "https://www.tourismpunjabindia.com/upload/Ropar/Anandpur_Sahib_Gurudwara.jpg",
          pincode: 140001),
      CityModel(
          id: 10,
          cityName: "Sangrur",
          imagePath:
              "https://www.tourismpunjabindia.com/upload/Sangrur/Giani_Zail_Singh_College_Sangrur.jpg",
          pincode: 148001)
    ]);
  }

  String getHeroTag({required CityModel city}) {
    return "${city.id}-${city.cityName}";
  }
}
