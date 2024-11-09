import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_punjab_tourism/constants/color_constants.dart';

class PlaceCityView extends StatelessWidget {
  final Function() onTap;
  final Function() onIconButtonPress;
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isAssetImage;
  final double? imageWidth;
  final double? imageHeight;
  final IconData iconData;
  final String heroTag;
  final bool showIcon;
  PlaceCityView(
      {required this.onTap,
      required this.title,
      required this.subtitle,
      required this.isAssetImage,
      required this.imagePath,
      required this.iconData,
      required this.heroTag,
      required this.onIconButtonPress,
      this.showIcon = true,
      this.imageHeight,
      this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, right: 10.0),
      child: Stack(
        children: [
          InkWell(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100.0),
              bottomLeft: Radius.circular(100.0),
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: ColorConstants.LIGHT_GREY,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(4, 10),
                    blurRadius: 8.0,
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100.0),
                  bottomLeft: Radius.circular(100.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: heroTag,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 10.0),
                      child: Material(
                        shape: const CircleBorder(),
                        elevation: 6.0,
                        child: ClipOval(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: getImage(
                                imagePath: imagePath,
                                isAssetImage: isAssetImage,
                                width: imageWidth,
                                height: imageHeight),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          subtitle,
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if(showIcon)
          Positioned(
            bottom: 0,
            right: 10,
            child: Transform.translate(
              offset: const Offset(15, 15),
              child: ElevatedButton(
                onPressed: onIconButtonPress,
                style: ElevatedButton.styleFrom(
                  elevation: 6.0,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20.0),
                ),
                child: Icon(iconData, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getImage(
      {required String imagePath,
      required bool isAssetImage,
      double? width,
      double? height}) {
    const BoxFit fit = BoxFit.cover;
    return isAssetImage
        ? Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: fit,
          )
        : CachedNetworkImage(
            imageUrl: imagePath,
            width: width,
            height: height,
            fit: fit,
            errorWidget: (context, url, error) {
              return const Icon(Icons.broken_image, size: 50);
            },
            progressIndicatorBuilder: (context, url, progress) {
              if (progress.progress == null)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return Center(
                child: CircularProgressIndicator(
                  value: progress.downloaded / (progress.totalSize ?? 1),
                ),
              );
            },
          );
  }
}
