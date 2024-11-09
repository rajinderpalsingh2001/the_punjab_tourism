import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_punjab_tourism/constants/color_constants.dart';
import 'package:the_punjab_tourism/controllers/ai_controller.dart';
import 'package:the_punjab_tourism/models/ai_input_model.dart';
import 'package:the_punjab_tourism/models/itinerary_model.dart';
import 'package:the_punjab_tourism/widgets/primary_heading.dart';
import 'package:the_punjab_tourism/widgets/transparent_input_field.dart';

class ItineraryUI extends StatefulWidget {
  final String cityName;
  ItineraryUI({required this.cityName});

  @override
  State<ItineraryUI> createState() => _ItineraryUIState();
}

class _ItineraryUIState extends State<ItineraryUI> {
  final AiController aiController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Itinerary? itinerary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Itinerary for ${widget.cityName}"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: getBody(),
        ),
      ),
    );
  }

  Widget getBody() {
    return itinerary == null ? getInputContainer() : generateItineraryUI();
  }

  Widget getInputContainer() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrimaryHeading(text: "You are in ${widget.cityName} for"),
          const SizedBox(
            height: 10.0,
          ),
          TransparentInputField(
            controller: aiController.numberOfDays,
            hintText: "Days",
          ),
          PrimaryHeading(text: "days"),
          const SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.black,
            minWidth: double.infinity,
            padding: const EdgeInsets.all(20.0),
            disabledColor: Colors.black,
            disabledTextColor: Colors.white,
            onPressed: isLoading
                ? null
                : () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      setState(() {
                        isLoading = true;
                      });

                      itinerary = await aiController.getItinerary(
                        input: AiInputModel(
                          city: widget.cityName,
                          days: int.parse(aiController.numberOfDays.text),
                        ),
                      );
                      setState(() {
                        isLoading = false;
                        itinerary;
                      });
                    }
                  },
            child: Row(
              children: [
                Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          isLoading
                              ? "Generating".toUpperCase()
                              : "Generate Itinerary".toUpperCase(),
                          style: TextStyle(
                              color: ColorConstants.LIGHT_GREY, fontSize: 18.0),
                        ))),
                isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget generateItineraryUI() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: itinerary!.days.length,
            itemBuilder: (context, index) {
              String dayKey = itinerary!.days.keys.elementAt(index);
              List<Place> places = itinerary!.days[dayKey] ?? [];
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0)),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.all(10.0),
                  childrenPadding: EdgeInsets.all(20.0),
                  shape: const Border(),
                  title: Text("Day ${index + 1}",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  children: places.map((place) {
                    return ExpansionTile(
                      title: Text(place.placeName),
                      subtitle: Text(place.placeDescription),
                      trailing: Text(place.preferredTime),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding: EdgeInsets.only(left:20.0),
                      children: [
                        Text("What to Explore?", style: TextStyle(fontWeight: FontWeight.bold),),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: place.whatToExplore.length,
                          itemBuilder: (context, j) {
                          return ListTile(
                            title: Text(place.whatToExplore[j]),
                            minLeadingWidth: 2,
                            leading: Text((j+1).toString()),
                          );
                        })
                      ],
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
