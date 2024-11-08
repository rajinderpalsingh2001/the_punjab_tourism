import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_punjab_tourism/controllers/place_controller.dart';
import 'package:the_punjab_tourism/models/city_model.dart';
import 'package:the_punjab_tourism/models/place_model.dart';
import 'package:the_punjab_tourism/widgets/place_city_view_widget.dart';
import 'package:the_punjab_tourism/widgets/primary_appbar.dart';
import 'package:the_punjab_tourism/widgets/primary_heading.dart';

class ViewCityPlacesUI extends StatefulWidget {
  final CityModel city;
  ViewCityPlacesUI({required this.city});

  @override
  State<ViewCityPlacesUI> createState() => _ViewCityPlacesUIState();
}

class _ViewCityPlacesUIState extends State<ViewCityPlacesUI> {
  final PlaceController placeController = Get.find();
  late List<PlaceModel> places;

  @override
  void initState() {
    super.initState();
    places = placeController.placesByCity[widget.city.id] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryAppBar(
        title: PrimaryHeading(
          text: widget.city.cityName,
          fontSize: 24.0,
        ),
        isCentered: true,
        backgroundImage: widget.city.imagePath,
        heroTag: "${widget.city.id}-${widget.city.cityName}",
        expandedHeight: 200,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: bodyContainer(),
        ),
      ),
    );
  }

  Widget bodyContainer() {
    return places.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
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
              PrimaryHeading(
                text: "Explore Places",
                fontSize: 24.0,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return PlaceCityView(
                      heroTag: "${places[index].id}-${places[index].placeName}",
                      title: places[index].placeName,
                      subtitle: places[index].description,
                      imagePath: places[index].imagePath,
                      isAssetImage: places[index].isAssetImage,
                      iconData: Icons.navigation,
                      onTap: () {
                        // Get.to(() => PlaceDetailUI(place: places[index]));
                      },
                    );
                  },
                ),
              ),
            ],
          );
  }
}
