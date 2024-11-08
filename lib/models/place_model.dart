class PlaceModel {
  int id;
  String placeName;
  String description;
  int cityId;
  String imagePath;
  bool isAssetImage;

  PlaceModel(
      {required this.id,
      required this.placeName,
      required this.description,
      required this.cityId,
      required this.imagePath,
      required this.isAssetImage});
}
