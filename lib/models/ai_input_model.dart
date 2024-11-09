class AiInputModel {
  String city;
  int days;

  AiInputModel({required this.city, required this.days});

  Map<String, dynamic> toMap() {
    return {'city': city, 'days': days};
  }
}
