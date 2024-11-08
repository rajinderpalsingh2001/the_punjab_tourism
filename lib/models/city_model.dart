class CityModel {
  int id;
  String cityName;
  String imagePath;
  bool isAssetImage;
  int pincode;

  CityModel(
      {required this.id,
      required this.cityName,
      required this.imagePath,
      required this.pincode,
      this.isAssetImage = false});
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "cityName": cityName,
      "imagePath": imagePath,
      "pincode": pincode,
      "isAssetImage": isAssetImage
    };
  }
}
