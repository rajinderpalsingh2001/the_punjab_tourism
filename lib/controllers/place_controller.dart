import 'package:get/get.dart';
import 'package:the_punjab_tourism/models/place_model.dart';

class PlaceController extends GetxController {
  List<PlaceModel> allPlaces = [];
  Map<int, List<PlaceModel>> placesByCity = {};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    allPlaces.addAll([
      // Amritsar
      PlaceModel(
          id: 1,
          placeName: "Golden Temple",
          description: "Spiritual heart of Sikhism, revered for its golden dome.",
          cityId: 1,
          imagePath:
              "https://m.media-amazon.com/images/I/715Sr0EKR5L._AC_UF1000,1000_QL80_.jpg",
          isAssetImage: false
          ),
PlaceModel(
  id: 2,
  placeName: "Jallianwala Bagh",
  description: "Historic park & memorial commemorating a massacre during British rule.",
  cityId: 1,
  imagePath: "https://example.com/jallianwala_bagh.jpg",
  isAssetImage: false,
),
PlaceModel(
  id: 3,
  placeName: "Wagah Border",
  description: "Patriotic daily border closing ceremony between India & Pakistan.",
  cityId: 1,
  imagePath: "https://example.com/wagah_border.jpg",
  isAssetImage: false,
),
PlaceModel(
  id: 4,
  placeName: "Shri Durgiana Temple",
  description: "Magnificent Hindu temple with a large reflecting pool",
  cityId: 1,
  imagePath: "https://example.com/wagah_border.jpg",
  isAssetImage: false,
),
PlaceModel(
  id: 5,
  placeName: "Partition Museum",
  description: "Tells the story of the partition of India & Pakistan in 1947.",
  cityId: 1,
  imagePath: "https://example.com/wagah_border.jpg",
  isAssetImage: false,
),
// chandigarh
PlaceModel(
  id: 6,
  placeName: "Sukhna Lake",
  description: "Man-made lake offering boating, gardens & a scenic backdrop.",
  cityId: 2,
  imagePath: "https://example.com/sukhna_lake.jpg",
  isAssetImage: false
),
PlaceModel(
  id: 7,
  placeName: "Rock Garden",
  description: "Unique sculpted garden made from recycled materials.",
  cityId: 2,
  imagePath: "https://example.com/rock_garden.jpg",
  isAssetImage: false
),
PlaceModel(
  id: 8,
  placeName: "Open Hand Monument",
  description: "Iconic symbol of Chandigarh, representing peace & unity.",
  cityId: 2,
  imagePath: "https://example.com/open_hand_monument.jpg",
  isAssetImage: false
),
PlaceModel(
  id: 9,
  placeName: "Museum of Art & Culture",
  description: "Houses a collection of Indian art & artifacts.",
  cityId: 2,
  imagePath: "https://example.com/museum_of_art_culture.jpg",
  isAssetImage: false
),
PlaceModel(
  id: 10,
  placeName: "Zakir Hussain Rose Garden",
  description: "Largest rose garden in Asia, boasting over 16,000 rose varieties.",
  cityId: 2,
  imagePath: "https://example.com/zakir_hussain_rose_garden.jpg",
  isAssetImage: false
),

// Patiala
PlaceModel(
  id: 11,
  placeName: "Qila Mubarak",
  description: "17th-century fort showcasing Mughal architecture.",
  cityId: 3,
  imagePath: "https://example.com/qila_mubarak_patiala.jpg", 
  isAssetImage: false
),
PlaceModel(
  id: 12,
  placeName: "Baradari Gardens",
  description: "Mughal-era terraced gardens with fountains & pavilions.",
  cityId: 3,
  imagePath: "https://example.com/baradari_gardens_patiala.jpg", 
  isAssetImage: false
),
PlaceModel(
  id: 13,
  placeName: "National Museum of Sikh History",
  description: "Exhibits Sikh history & culture through artifacts & multimedia.",
  cityId: 3,
  imagePath: "https://example.com/national_museum_of_sikh_history_patiala.jpg", 
  isAssetImage: false
),
PlaceModel(
  id: 14,
  placeName: "Sheesh Mahal",
  description: "Palace known for its intricate mirror work & frescoes.",
  cityId: 3,
  imagePath: "https://example.com/sheesh_mahal_patiala.jpg", 
  isAssetImage: false
),
// Annand pur sahib

PlaceModel(
  id: 15,
  placeName: "Takht Sri Keshgarh Sahib",
  description: "Holiest Gurudwara for Sikhs, commemorating the Khalsa Panth.",
  cityId: 4,
  imagePath: "url",
  isAssetImage: false
),
PlaceModel(
  id: 16,
  placeName: "Virasat-e-Khalsa",
  description: "Interactive museum showcasing Sikh history & culture.",
  cityId: 4,
  imagePath: "url",
  isAssetImage: false
),
PlaceModel(
  id: 17,
  placeName: "Anandpur Sahib Fort",
  description: "Historical fort associated with Sikh Gurus.",
  cityId: 4,
  imagePath: "[url]",
  isAssetImage: false
),
// Kapurthala
PlaceModel(
id: 15,
placeName: "Takht Sri Keshgarh Sahib",
description: "Holiest Gurudwara for Sikhs, commemorating the Khalsa Panth.",
cityId: 4,
imagePath: "url",
isAssetImage: false
),
PlaceModel(
  id: 16,
  placeName: "Virasat-e-Khalsa",
  description: "Interactive museum showcasing Sikh history & culture.",
  cityId: 4,
  imagePath: "url",
  isAssetImage: false
),
PlaceModel(
  id: 17,
  placeName: "Anandpur Sahib Fort",
  description: "Historical fort associated with Sikh Gurus.",
  cityId: 4,
  imagePath: "url",
  isAssetImage: false
),
    ]);

    initializePlacesByCity();
  }

  initializePlacesByCity() {
    for (PlaceModel place in allPlaces) {
      placesByCity.putIfAbsent(place.cityId, () => []);
      placesByCity[place.cityId]!.add(place);
    }
  }
}
