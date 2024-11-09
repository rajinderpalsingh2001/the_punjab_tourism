import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_punjab_tourism/constants/color_constants.dart';

class LeadingBackButton extends StatelessWidget {
  const LeadingBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
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
        );
  }
}