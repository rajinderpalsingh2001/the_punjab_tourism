class Place {
  final String placeName;
  final String placeDescription;
  final List<String> whatToExplore;
  final String preferredTime;

  Place({
    required this.placeName,
    required this.placeDescription,
    required this.whatToExplore,
    required this.preferredTime,
  });

  // Convert Place to Map
  Map<String, dynamic> toMap() {
    return {
      'place_name': placeName,
      'place_description': placeDescription,
      'what_to_explore': whatToExplore,
      'preffered_time': preferredTime,
    };
  }

  // Create Place from Map
  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      placeName: map['place_name'],
      placeDescription: map['place_description'],
      whatToExplore: List<String>.from(map['what_to_explore']),
      preferredTime: map['preffered_time'],
    );
  }
}

class Itinerary {
  final Map<String, List<Place>> days;

  Itinerary({required this.days});

  // Convert Itinerary to Map
  Map<String, dynamic> toMap() {
    return days.map((key, value) => MapEntry(key, value.map((place) => place.toMap()).toList()));
  }

  // Create Itinerary from Map
  factory Itinerary.fromMap(Map<String, dynamic> map) {
    return Itinerary(
      days: map.map(
        (key, value) => MapEntry(
          key,
          List<Place>.from((value as List).map((placeMap) => Place.fromMap(placeMap))),
        ),
      ),
    );
  }
}
