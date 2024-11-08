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
      PlaceModel(
          id: 1,
          placeName: "Golden Temple",
          description: "The holiest Gurdwara and a major pilgrimage site for Sikhs.",
          cityId: 1,
          imagePath:
              "https://m.media-amazon.com/images/I/715Sr0EKR5L._AC_UF1000,1000_QL80_.jpg",
          isAssetImage: false),
PlaceModel(
  id: 2,
  placeName: "Jallianwala Bagh",
  description: "Historical garden and memorial of national importance.",
  cityId: 1,
  imagePath: "https://example.com/jallianwala_bagh.jpg",
  isAssetImage: false,
),
PlaceModel(
  id: 3,
  placeName: "Wagah Border",
  description: "Famous for its daily flag-lowering ceremony.",
  cityId: 1,
  imagePath: "https://example.com/wagah_border.jpg",
  isAssetImage: false,
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
