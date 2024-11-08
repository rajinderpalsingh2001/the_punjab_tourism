import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_punjab_tourism/constants/color_constants.dart';
import 'package:the_punjab_tourism/controllers/city_controller.dart';
import 'package:the_punjab_tourism/models/city_model.dart';
import 'package:the_punjab_tourism/ui/view_city_places_ui.dart';
import 'package:the_punjab_tourism/widgets/place_city_view_widget.dart';
import 'package:the_punjab_tourism/widgets/primary_appbar.dart';
import 'package:the_punjab_tourism/widgets/primary_heading.dart';
import 'package:the_punjab_tourism/widgets/primary_search_field.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  CityController cityController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PrimaryAppBar(
      title: PrimaryHeading(text: "Welcome to Punjab", fontSize: 24.0),
      expandedHeight: 100,
      isCentered: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: bodyContainer(),
      ),
    ));
  }

  Widget bodyContainer() {
    return Column(
      children: [
        PrimarySearchField(
          onChanged: (value) {
            print(value);
          },
          hintText: "Search City",
          controller: cityController.searchCityNameController,
        ),
        Expanded(child: selectCityContainer()),
      ],
    );
  }

  Widget selectCityContainer() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: cityController.allCities.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return _buildCityCard(city: cityController.allCities[index]);
      },
    );
  }

  Widget _buildCityCard({required CityModel city}) {
    return PlaceCityView(
      title: city.cityName,
      heroTag: "${city.id}-${city.cityName}",
      subtitle: city.pincode.toString(),
      imagePath: city.imagePath,
      isAssetImage: city.isAssetImage,
      iconData: Icons.map,
      onTap: () {
      Get.to(() => ViewCityPlacesUI(city: city));
    });
  }


}
