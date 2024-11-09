import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_punjab_tourism/constants/color_constants.dart';

class PrimaryAppBar extends StatelessWidget {
  Widget? titleWidget;
  String? titleText;
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
      {this.titleWidget,
      this.titleText,
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
              pinned: pinned,
              toolbarHeight: 80,
              centerTitle: isCentered,
              
              // surfaceTintColor: ColorConstants.LIGHT_GREY,
              // backgroundColor: AppTheme.lightWhite,
              flexibleSpace: FlexibleSpaceBar(
                title: titleWidget ?? LayoutBuilder(
                        builder: (context, constraints) {
                          final bool isExpanded = constraints.maxHeight > 130;
                          return TweenAnimationBuilder<Color?>(
                            tween: ColorTween(
                              begin: isExpanded ? Colors.black : Colors.white,
                              end: isExpanded ? Colors.white : Colors.black,
                            ),
                            duration: const Duration(milliseconds: 300),
                            builder: (context, color, child) {
                              return Text(
                                titleText!,
                                style: TextStyle(
                                  color:
                                      color ?? Colors.black, // Fallback color
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          );
                        },
                      ),
                centerTitle: isCentered,
                background:
                    backgroundImage != null // Add background image logic
                        ? Hero(
                            tag: heroTag!,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0)),
                              child: CachedNetworkImage(
                                imageUrl: backgroundImage!,
                                fit: BoxFit.cover,
                              ),
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
