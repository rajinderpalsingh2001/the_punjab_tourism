import 'package:flutter/material.dart';
import 'package:the_punjab_tourism/constants/color_constants.dart';

class PlaceCityView extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isAssetImage;
  final double? imageWidth;
  final double? imageHeight;
  final IconData iconData;
  final String heroTag;
  PlaceCityView(
      {required this.onTap,
      required this.title,
      required this.subtitle,
      required this.isAssetImage,
      required this.imagePath,
      required this.iconData,
      required this.heroTag,
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
          Positioned(
            bottom: 0,
            right: 10,
            child: Transform.translate(
              offset: const Offset(15, 15),
              child: ElevatedButton(
                onPressed: () {
                  // Button action
                },
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
        : Image.network(
            imagePath,
            width: width,
            height: height,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image, size: 50);
            },
          );
  }
}
