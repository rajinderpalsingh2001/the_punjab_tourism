import 'package:flutter/material.dart';
import 'package:the_punjab_tourism/constants/color_constants.dart';

class PrimaryAppBar extends StatelessWidget {
  Widget title;
  bool isCentered;
  List<Widget>? actions;
  double expandedHeight;
  Widget body;
  bool pinned;
  Widget? leading;
  double? leadingWidth;
  PreferredSizeWidget? bottom;
  String? backgroundImage;
  String? heroTag;
  Color primaryColor;

  PrimaryAppBar(
      {required this.title,
      required this.body,
      this.pinned = false,
      this.leading,
      this.expandedHeight = 150.0,
      this.leadingWidth,
      this.bottom,
      this.isCentered = true,
      this.backgroundImage,
      this.heroTag,
      this.primaryColor = Colors.black,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: expandedHeight,
              floating: false,
              iconTheme: IconThemeData(color: primaryColor),
              pinned: pinned,
              toolbarHeight: 80,
              // surfaceTintColor: ColorConstants.LIGHT_GREY,
              // backgroundColor: AppTheme.lightWhite,
              flexibleSpace: FlexibleSpaceBar(
                title: title,
                centerTitle: isCentered,
                background:
                    backgroundImage != null // Add background image logic
                        ? Hero(
                            tag: heroTag!,
                            child: Image.network(
                              backgroundImage!,
                              fit: BoxFit.cover,
                            ))
                        : null,
              ),
              leadingWidth: leadingWidth,
              leading: leading,
              actions: actions,
              bottom: bottom,
            ),
          ];
        },
        body: body);
  }
}
