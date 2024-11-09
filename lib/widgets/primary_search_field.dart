import 'package:flutter/material.dart';
import 'package:the_punjab_tourism/constants/color_constants.dart';

class PrimarySearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController controller;

  const PrimarySearchField(
      {Key? key, required this.onChanged, required this.hintText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left:10.0, right:10.0, top: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: ColorConstants.LIGHT_GREY,
        borderRadius: BorderRadius.circular(.0),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          icon: Icon(Icons.search, color: ColorConstants.DARK_GREY),
        ),
      ),
    );
  }
}
