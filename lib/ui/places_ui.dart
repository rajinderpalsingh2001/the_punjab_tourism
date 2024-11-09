import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_punjab_tourism/constants/color_constants.dart';
import 'package:the_punjab_tourism/controllers/ai_controller.dart';
import 'package:the_punjab_tourism/controllers/city_controller.dart';
import 'package:the_punjab_tourism/controllers/place_controller.dart';
import 'package:the_punjab_tourism/models/ai_input_model.dart';
import 'package:the_punjab_tourism/models/itinerary_model.dart';
import 'package:the_punjab_tourism/models/city_model.dart';
import 'package:the_punjab_tourism/models/place_model.dart';
import 'package:the_punjab_tourism/ui/itinerary_ui.dart';
import 'package:the_punjab_tourism/ui/place_detail_ui.dart';
import 'package:the_punjab_tourism/widgets/place_city_view_widget.dart';
import 'package:the_punjab_tourism/widgets/primary_appbar.dart';
import 'package:the_punjab_tourism/widgets/primary_search_field.dart';

class CityPlacesUI extends StatefulWidget {
  final CityModel city;
  CityPlacesUI({required this.city});

  @override
  State<CityPlacesUI> createState() => _CityPlacesUIState();
}

class _CityPlacesUIState extends State<CityPlacesUI> {
  CityController cityController = Get.find();
  final PlaceController placeController = Get.find();
  List<PlaceModel> places = [];

  @override
  void initState() {
    super.initState();
    places = placeController.placesByCity[widget.city.id] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryAppBar(
        titleText: widget.city.cityName,
        isCentered: true,
        backgroundImage: widget.city.imagePath,
        heroTag: cityController.getHeroTag(city: widget.city),
        expandedHeight: 200,
        leading: IconButton.filled(
          color: Colors.black,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(ColorConstants.LIGHT_GREY),
            elevation: const WidgetStatePropertyAll(6.0),
          ),
          splashColor: ColorConstants.LIGHT_GREY,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, size: 18),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: ColorConstants.LIGHT_GREY,
              backgroundColor: ColorConstants.LIGHT_GREY
            ),
                  onPressed: () {
                    Get.to(() => ItineraryUI(cityName: widget.city.cityName));
                  },
                  child: Text("Plan Itinerary", style: TextStyle(color: Colors.black),))
        ],
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: bodyContainer(),
        ),
      ),
    );
  }

  Widget bodyContainer() {
    return places.isEmpty
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.hourglass_empty, size: 50, color: Colors.grey),
                SizedBox(height: 10),
                Text(
                  "Oops! No Places",
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                ),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 18.0,
              ),
              PrimarySearchField(
                  onChanged: (value) {
                    print("called");
                  },
                  hintText: "Search in ${widget.city.cityName}",
                  controller: placeController.searchPlaceController),
             
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return PlaceCityView(
                      heroTag: placeController.getHeroTag(place: places[index]),
                      title: places[index].placeName,
                      subtitle: places[index].description,
                      imagePath: places[index].imagePath,
                      isAssetImage: places[index].isAssetImage,
                      iconData: Icons.navigation,
                      onTap: () {
                        Get.to(() => PlaceDetailUI(place: places[index]));
                      },
                    );
                  },
                ),
              ),
            ],
          );
  }
}
