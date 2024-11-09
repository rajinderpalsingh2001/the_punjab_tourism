class PlaceModel {
  int id;
  String placeName;
  String description;
  int cityId;
  String imagePath;
  bool isAssetImage;
  String longDescription;

  PlaceModel(
      {required this.id,
      required this.placeName,
      required this.description,
      required this.cityId,
      required this.imagePath,
      required this.longDescription,
      required this.isAssetImage});
}
