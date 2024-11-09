class PlaceModel {
  int id;
  String placeName;
  String description;
  int cityId;
  String imagePath;
  bool isAssetImage;
  String longDescription;
  bool isFoodItem;
  double? latitude;
  double? longitude;

  PlaceModel(
      {required this.id,
      required this.placeName,
      required this.description,
      required this.cityId,
      required this.imagePath,
      required this.longDescription,
      required this.isAssetImage,
      this.latitude, this.longitude,
      this.isFoodItem = false});
}
