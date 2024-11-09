import 'package:flutter/material.dart';
import 'package:panorama_viewer_plus/panorama_viewer_plus.dart';
import 'package:the_punjab_tourism/models/place_model.dart';
import 'package:the_punjab_tourism/widgets/leading_back_button.dart';
import 'package:the_punjab_tourism/widgets/primary_heading.dart';

class PlaceDetailUI extends StatefulWidget {
  final PlaceModel place;
  PlaceDetailUI({required this.place});

  @override
  State<PlaceDetailUI> createState() => _PlaceDetailUIState();
}

class _PlaceDetailUIState extends State<PlaceDetailUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 120.0,
            child: Column(
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    elevation: 8.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      child: CustomPanoramaViewer(
                        // imagePath:
                        //     "https://lh5.googleusercontent.com/p/AF1QipMYRi4cZHJ4f2VJNUEg7OS3lkwm0baQmJUbXDhk",
                        imagePath: "assets/pano/golden_temple.jpg",
                        isAssetImage: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.15,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.all(10.0),
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.drag_handle),
                          ),
                          PrimaryHeading(
                            text: widget.place.placeName,
                            fontSize: 24.0,
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            widget.place.longDescription,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: -30,
                      right: 20,
                      child: IconButton.filled(
                          padding: EdgeInsets.all(20.0),
                          onPressed: () {},
                          icon: Icon(Icons.navigation))),
                ],
              );
            },
          ),
          Positioned(top: 25, left: 10, child: LeadingBackButton()),
        ],
      ),
    );
  }
}
