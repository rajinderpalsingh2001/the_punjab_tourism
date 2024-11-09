import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:the_punjab_tourism/models/place_model.dart';

class PlaceController extends GetxController {
  TextEditingController searchPlaceController = TextEditingController();

  List<PlaceModel> allPlaces = [];
  Map<int, List<PlaceModel>> placesByCity = {};
  Map<int, List<PlaceModel>> foodsByCity = {};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    allPlaces.addAll([
      // Amritsar
      PlaceModel(
          id: 1,
          placeName: "Golden Temple",
          description:
              "Spiritual heart of Sikhism, revered for its golden dome.",
          cityId: 1,
          latitude: 31.62019544769442,
          longitude: 74.87657727079666,
          imagePath: "assets/Amritsar/golden_temple_outro.jpg",
          longDescription:
              "The Golden Temple, also known as Harmandir Sahib, is a magnificent Sikh Gurudwara in Amritsar, Punjab. Its stunning golden dome and serene pool of nectar attract millions of visitors annually. The temple is a spiritual epicenter for Sikhs, offering peace and devotion to all who visit. Its rich history, coupled with its architectural brilliance, embodies a timeless symbol of spirituality, equality, and human fraternity. The langar, or community kitchen, serves free meals to thousands daily, reinforcing the temple’s message of selfless service and universal brotherhood.",
          isAssetImage: true),
      PlaceModel(
        id: 2,
        placeName: "Jallianwala Bagh",
        description:
            "Historic park & memorial commemorating a massacre during British rule.",
        cityId: 1,
        latitude: 31.620931430040443,
        longitude: 74.88016549524019,
        longDescription:
            "Jallianwala Bagh in Amritsar stands as a solemn reminder of the tragic massacre that occurred here in 1919 during British colonial rule. The site is now a public garden and memorial, commemorating the thousands of innocent lives lost. Visitors can see the bullet-ridden walls and the Martyrs' Well, preserving the memory of that dark day. Jallianwala Bagh serves as a powerful testament to India's struggle for independence and the resilience of its people.",
        imagePath: "assets/Amritsar/centeral_monument_jalliwawala_bagh.jpg",
        isAssetImage: true,
      ),
      PlaceModel(
        id: 3,
        placeName: "Wagah Border",
        description:
            "Patriotic daily border closing ceremony between India & Pakistan.",
        cityId: 1,
        latitude: 31.60541701213676,
        longitude: 74.5739641645523,
        longDescription:
            "The Wagah Border, located between India and Pakistan, is famous for its daily flag-lowering ceremony. This ceremonial event draws crowds who gather to witness the synchronized display of patriotic fervor by border guards from both nations. The atmosphere is electric, with spirited cheers and slogans celebrating national pride. Beyond its spectacle, the Wagah Border symbolizes the complex relationship between the two neighboring countries, serving as both a physical and emotional landmark.",
        imagePath: "assets/Amritsar/wagha_border_outro.jpg",
        isAssetImage: true,
      ),
      PlaceModel(
        id: 4,
        placeName: "Shri Durgiana Temple",
        description: "Magnificent Hindu temple with a large reflecting pool",
        cityId: 1,
        latitude: 31.629081183639702,
        longitude: 74.86732874920982,
        longDescription:
            "The Shri Durgiana Temple in Amritsar, often compared to the Golden Temple, features stunning architectural design with a sacred pond. Dedicated to Goddess Durga, this Hindu temple draws thousands of devotees seeking blessings. The temple complex includes shrines to Lord Vishnu, Lakshmi, and Hanuman, making it a significant spiritual hub. Its serene environment, combined with intricate carvings and a golden dome, offers a peaceful retreat for worship and reflection.",
        imagePath: "assets/Amritsar/durgiana_temple_outro.jpg",
        isAssetImage: true,
      ),
      PlaceModel(
        id: 5,
        placeName: "Partition Museum",
        description:
            "Tells the story of the partition of India & Pakistan in 1947.",
        cityId: 1,
        latitude: 31.625958403777055,
        longitude: 74.8790949259276,
        longDescription:
            "The Partition Museum in Amritsar captures the harrowing experiences of the Partition of India in 1947. Through artifacts, personal stories, and multimedia exhibits, the museum recounts one of the largest mass migrations in history. Visitors gain a deeper understanding of the human cost of Partition, as well as the resilience and strength of those affected. It serves as a crucial archive for preserving this significant chapter of South Asian history.",
        imagePath: "assets/Amritsar/partition_museum_outro.jpg",
        isAssetImage: true,
      ),
      PlaceModel(
          id: 18,
          placeName: "Amritsari Kulcha",
          description:
              "A fluffy, buttery flatbread stuffed with spiced potatoes and peas.",
          cityId: 1,
          imagePath: "assets/food/amritsari_aloo_kulche.jpg",
          longDescription:
              "A fluffy, buttery flatbread stuffed with a delicious mixture of spiced potatoes and peas. Best enjoyed with a side of chole (chickpea curry). Try it at Kake Da Hotel or Giani Buta Singh.",
          isAssetImage: true,
          isFoodItem: true),

      PlaceModel(
          id: 19,
          placeName: "Amritsari Fish",
          description: "A crispy, deep-fried fish marinated in spices.",
          cityId: 1,
          imagePath: "assets/food/amritsari_fish.jpg",
          longDescription:
              "A crispy, deep-fried fish marinated in a blend of spices. It's a must-try for seafood lovers. Head to Crystal Restaurant or Makhan Fish Corner.",
          isAssetImage: true,
          isFoodItem: true),

      PlaceModel(
          id: 20,
          placeName: "Lassi",
          description: "A creamy, yogurt-based drink.",
          cityId: 1,
          imagePath: "assets/food/amritsari_lassi.jpg",
          longDescription:
              "A creamy, yogurt-based drink that comes in various flavors like sweet, salty, and fruity. Perfect for cooling down on a hot day. Try it at Giani Tea Stall or Laxmi Chocolate Shop.",
          isAssetImage: true,
          isFoodItem: true),

      PlaceModel(
          id: 21,
          placeName: "Tandoori Chicken",
          description:
              "Juicy, flavorful chicken marinated in yogurt and spices.",
          cityId: 1,
          imagePath: "assets/food/amritsari_butter_Chicken.jpg",
          longDescription:
              "A juicy, flavorful chicken marinated in yogurt and spices, then cooked in a tandoor oven. Best enjoyed with naan or roti. Try it at Brother's Dhaba or Makhan Fish Corner.",
          isAssetImage: true,
          isFoodItem: true),
// chandigarh
      PlaceModel(
          id: 6,
          placeName: "Sukhna Lake",
          description:
              "Man-made lake offering boating, gardens & a scenic backdrop.",
          cityId: 2,
          latitude: 30.740626471950428,
          longitude: 76.8182590464811,
          longDescription:
              "Sukhna Lake in Chandigarh is a picturesque man-made reservoir, offering a tranquil escape from city life. Surrounded by lush greenery, it provides a perfect setting for leisure activities such as boating, walking, and bird-watching. The lake is a hub for fitness enthusiasts and nature lovers alike, while its serene waters reflect the changing hues of the sky, creating a breathtaking view. Sukhna Lake also hosts several cultural events and festivals throughout the year.",
          imagePath: "assets/chandigarh/sukhna_lake_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 7,
          placeName: "Rock Garden",
          description: "Unique sculpted garden made from recycled materials.",
          cityId: 2,
          latitude: 30.75295930491183,
          longitude: 76.80897545061907,
          longDescription:
              "The Rock Garden of Chandigarh is a unique artistic marvel created by Nek Chand. This sprawling garden features sculptures and installations crafted from recycled and discarded materials like ceramics, bangles, and industrial waste. The labyrinthine pathways, waterfalls, and amphitheaters add to its charm, making it a must-visit attraction. It stands as a testament to the creative potential of reuse, blending art with sustainability.",
          imagePath: "assets/chandigarh/rock_garden_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 8,
          placeName: "Open Hand Monument",
          description:
              "Iconic symbol of Chandigarh, representing peace & unity.",
          cityId: 2,
          latitude: 30.759232543944577,
          longitude: 76.8074654682166,
          longDescription:
              "The Open Hand Monument in Chandigarh, designed by Le Corbusier, is an iconic symbol of peace and unity. This massive metal structure, shaped like a hand, rotates with the wind, representing openness to ideas and universal harmony. Situated in the Capitol Complex, the monument reflects Chandigarh’s modernist architectural ethos. It serves as a beacon of hope, promoting cooperation and understanding in a diverse world.",
          imagePath: "assets/chandigarh/handmonument_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 9,
          placeName: "Museum of Art & Culture",
          description: "Houses a collection of Indian art & artifacts.",
          cityId: 2,
          latitude: 30.750719007806268,
          longitude: 76.78721000739846,
          longDescription:
              "The Museum of Art & Culture in Chandigarh houses a rich collection of Indian art, including ancient sculptures, miniature paintings, and modern artworks. The museum offers visitors a glimpse into the region's diverse cultural heritage. Special exhibitions and interactive sessions make it an educational experience for all age groups. Its well-curated displays and serene ambiance provide an enriching journey through India’s artistic evolution.",
          imagePath: "assets/chandigarh/museum_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 10,
          placeName: "Zakir Hussain Rose Garden",
          description:
              "Largest rose garden in Asia, boasting over 16,000 rose varieties.",
          cityId: 2,
          latitude: 30.747697883776887,
          longitude: 76.78279473868808,
          longDescription:
              "Zakir Hussain Rose Garden in Chandigarh is Asia’s largest rose garden, sprawling over 30 acres. It boasts an impressive collection of over 16,000 rose varieties, along with other medicinal and decorative plants. The garden is a visual treat, especially during the annual Rose Festival, which features cultural performances, flower competitions, and stalls. It's a paradise for nature lovers and a peaceful retreat for those seeking relaxation amidst fragrant blooms.",
          imagePath: "assets/chandigarh/zakhir_husen_garden.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 23,
          placeName: "Sarson Da Saag and Makki Di Roti",
          description: "Creamy spinach curry with cornmeal flatbreads.",
          cityId: 2,
          imagePath: "assets/food/sarson_ka_sagh_chandigarh.jpg",
          longDescription:
              "A wintertime staple, this dish features a creamy spinach curry served with cornmeal flatbreads. A taste of Punjabi comfort food. Try it at any dhaba in Chandigarh.",
          isAssetImage: true,
          isFoodItem: true),

      PlaceModel(
          id: 24,
          placeName: "Butter Chicken",
          description: "Rich, creamy tomato-based curry with tender chicken.",
          cityId: 2,
          imagePath: "assets/food/butter_Chicken_chadigarh.jpg",
          longDescription:
              "A rich, creamy tomato-based curry with tender pieces of chicken. A popular dish across India, but Chandigarh does it particularly well. Try it at Sector 7 or 17.",
          isAssetImage: true,
          isFoodItem: true),

      PlaceModel(
          id: 25,
          placeName: "Tandoori Momos",
          description: "Grilled momos with a spicy chutney.",
          cityId: 2,
          imagePath: "assets/food/tandoori_momos_chandigah.jpg",
          longDescription:
              "A unique twist on the classic dumpling, these momos are grilled to perfection in a tandoor oven. Enjoy them with a spicy chutney. Try them at any street food vendor in Sector 17.",
          isAssetImage: true,
          isFoodItem: true),

      PlaceModel(
          id: 26,
          placeName: "Punjabi Thali",
          description:
              "A variety of Punjabi dishes, including curries, breads, and desserts.",
          cityId: 2,
          imagePath: "assets/food/punjabi_thali_chandigarh.jpg",
          longDescription:
              "A hearty meal featuring a variety of Punjabi dishes, including curries, breads, and desserts. A great way to sample the flavors of the region. Try it at any Punjabi restaurant in Chandigarh.",
          isAssetImage: true,
          isFoodItem: true),

// Patiala
      PlaceModel(
          id: 11,
          placeName: "Qila Mubarak",
          description: "17th-century fort showcasing Mughal architecture.",
          cityId: 3,
          latitude: 30.324445632407695,
          longitude: 76.40328977983842,
          longDescription:
              "Qila Mubarak in Patiala is a historic 17th-century fort showcasing the grandeur of Mughal and Sikh architectural styles. The complex includes the main palace, courtyards, and a stunning Durbar Hall with intricate frescoes and mirrorwork. Qila Mubarak serves as a vital link to Punjab’s royal history, offering insights into its rich cultural legacy. Visitors can explore the fort's imposing gates, secret passages, and artifacts from the royal era.",
          imagePath: "assets/patiala/qila_mubarak_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 12,
          placeName: "Baradari Gardens",
          description:
              "Mughal-era terraced gardens with fountains & pavilions.",
          cityId: 3,
          latitude: 30.335346451569063,
          longitude: 76.39222623751073,
          longDescription:
              "Baradari Gardens in Patiala is a serene Mughal-era garden featuring lush lawns, fountains, and colonial-era structures. Originally designed as a leisure space for the royal family, it now serves as a popular spot for locals and tourists. The garden's name derives from the 12-door pavilion at its center, which offers a panoramic view of the surroundings. Its vibrant flora and peaceful ambiance make it ideal for picnics and leisurely walks.",
          imagePath: "assets/patiala/baradari_gardens_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 13,
          placeName: "National Museum of Sikh History",
          description:
              "Exhibits Sikh history & culture through artifacts & multimedia.",
          cityId: 3,
          latitude: 30.916127797601707,
          longitude: 76.20966863942142,
          longDescription:
              "The National Museum of Sikh History in Patiala showcases the rich heritage and spiritual journey of Sikhism. Through a vast collection of artifacts, manuscripts, and multimedia exhibits, it narrates key events in Sikh history, including the lives of the ten Gurus and the formation of the Khalsa. The museum provides an immersive experience, offering visitors a deeper understanding of Sikh values, culture, and their impact on Indian history.",
          imagePath: "assets/patiala/international-sikh-museum_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 14,
          placeName: "Sheesh Mahal",
          description: "Palace known for its intricate mirror work & frescoes.",
          cityId: 3,
          longDescription:
              "Sheesh Mahal in Patiala is a stunning palace renowned for its intricate mirror work and colorful frescoes. Built during the reign of Maharaja Narinder Singh, the palace reflects the grandeur of the royal era. It houses a museum displaying rare artifacts, including a gallery dedicated to miniature paintings. The Sheesh Mahal’s beauty and historical significance make it a key attraction for history enthusiasts and art lovers.",
          latitude: 31.213923460436845,
          longitude: 76.70459755877695,
          imagePath: "assets/patiala/sheesh_mahal_patiala.jpg",
          isAssetImage: true),
// Annand pur sahib

      PlaceModel(
          id: 15,
          placeName: "Takht Sri Keshgarh Sahib",
          description:
              "Holiest Gurudwara for Sikhs, commemorating the Khalsa Panth.",
          cityId: 4,
          longDescription:
              "Takht Sri Keshgarh Sahib, located in Anandpur Sahib, is one of the five Takhts, or seats of authority, in Sikhism. It holds immense religious significance as the birthplace of the Khalsa Panth. The Gurudwara’s serene ambiance, coupled with its historical importance, attracts pilgrims and tourists alike. Its intricate architecture and spiritual aura offer a profound experience of devotion and peace.",
          latitude: 31.235660954056772,
          longitude: 76.49875170318278,
          imagePath: "assets/anandpursahib/takhtshri_keshgarh_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 16,
          placeName: "Virasat-e-Khalsa",
          description: "Interactive museum showcasing Sikh history & culture.",
          cityId: 4,
          latitude: 31.234584247219882,
          longitude: 76.50727631165425,
          longDescription:
              "Virasat-e-Khalsa is an interactive museum in Anandpur Sahib that celebrates Sikh history and culture. Designed with modern architecture, the museum uses innovative exhibits, including audio-visual displays, to narrate the story of Sikhism from its inception to the present. It provides a deep and engaging experience for visitors, highlighting the religion’s core values and its significant contributions to humanity.",
          imagePath: "assets/anandpursahib/virasat-e-khalsa-outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 17,
          placeName: "Anandpur Sahib Fort",
          description: "Historical fort associated with Sikh Gurus.",
          cityId: 4,
          latitude: 31.235464719202312,
          longitude: 76.49906234589582,
          longDescription:
              "Virasat-e-Khalsa is an interactive museum in Anandpur Sahib that celebrates Sikh history and culture. Designed with modern architecture, the museum uses innovative exhibits, including audio-visual displays, to narrate the story of Sikhism from its inception to the present. It provides a deep and engaging experience for visitors, highlighting the religion’s core values and its significant contributions to humanity.",
          imagePath: "assets/anandpursahib/anandpur_sahib_outro.jpg",
          isAssetImage: true),
    ]);
    initializePlacesByCity();
  }

  initializePlacesByCity() {
    for (PlaceModel place in allPlaces) {
      placesByCity.putIfAbsent(place.cityId, () => []);
      foodsByCity.putIfAbsent(place.cityId, () => []);
      if (!place.isFoodItem) {
        placesByCity[place.cityId]!.add(place);
      } else {
        foodsByCity[place.cityId]!.add(place);
      }
    }
  }

  String getHeroTag({required PlaceModel place}) {
    return "${place.id}-${place.placeName}";
  }

  Future launchMap({required PlaceModel place}) async {
    if (await MapLauncher.isMapAvailable(MapType.google) == true) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(place.latitude!, place.longitude!),
        title: place.placeName,
      );
    }
  }
}
