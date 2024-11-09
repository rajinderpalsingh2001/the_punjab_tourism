import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_punjab_tourism/models/place_model.dart';

class PlaceController extends GetxController {
  TextEditingController searchPlaceController = TextEditingController();

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
          description:
              "Spiritual heart of Sikhism, revered for its golden dome.",
          cityId: 1,
          imagePath:
              "assets/Amritsar/golden_temple_outro.jpg",
          longDescription: "The Golden Temple, also known as Harmandir Sahib, is a magnificent Sikh Gurudwara in Amritsar, Punjab. Its stunning golden dome and serene pool of nectar attract millions of visitors annually. The temple is a spiritual epicenter for Sikhs, offering peace and devotion to all who visit. Its rich history, coupled with its architectural brilliance, embodies a timeless symbol of spirituality, equality, and human fraternity. The langar, or community kitchen, serves free meals to thousands daily, reinforcing the temple’s message of selfless service and universal brotherhood.",
          isAssetImage: true),
      PlaceModel(
        id: 2,
        placeName: "Jallianwala Bagh",
        description:
            "Historic park & memorial commemorating a massacre during British rule.",
        cityId: 1,
        longDescription: "Jallianwala Bagh in Amritsar stands as a solemn reminder of the tragic massacre that occurred here in 1919 during British colonial rule. The site is now a public garden and memorial, commemorating the thousands of innocent lives lost. Visitors can see the bullet-ridden walls and the Martyrs' Well, preserving the memory of that dark day. Jallianwala Bagh serves as a powerful testament to India's struggle for independence and the resilience of its people.",
        imagePath: "assets/Amritsar/centeral_monument_jalliwawala_bagh.jpg",
        isAssetImage: true,
      ),
      PlaceModel(
        id: 3,
        placeName: "Wagah Border",
        description:
            "Patriotic daily border closing ceremony between India & Pakistan.",
        cityId: 1,
        longDescription: "The Wagah Border, located between India and Pakistan, is famous for its daily flag-lowering ceremony. This ceremonial event draws crowds who gather to witness the synchronized display of patriotic fervor by border guards from both nations. The atmosphere is electric, with spirited cheers and slogans celebrating national pride. Beyond its spectacle, the Wagah Border symbolizes the complex relationship between the two neighboring countries, serving as both a physical and emotional landmark.",
        imagePath: "assets/Amritsar/wagha_border_outro.jpg",
        isAssetImage: true,
      ),
      PlaceModel(
        id: 4,
        placeName: "Shri Durgiana Temple",
        description: "Magnificent Hindu temple with a large reflecting pool",
        cityId: 1,
        longDescription: "The Shri Durgiana Temple in Amritsar, often compared to the Golden Temple, features stunning architectural design with a sacred pond. Dedicated to Goddess Durga, this Hindu temple draws thousands of devotees seeking blessings. The temple complex includes shrines to Lord Vishnu, Lakshmi, and Hanuman, making it a significant spiritual hub. Its serene environment, combined with intricate carvings and a golden dome, offers a peaceful retreat for worship and reflection.",
        imagePath: "assets/Amritsar/durgiana_temple_outro.jpg",
        isAssetImage: true,
      ),
      PlaceModel(
        id: 5,
        placeName: "Partition Museum",
        description:
            "Tells the story of the partition of India & Pakistan in 1947.",
        cityId: 1,
        longDescription: "The Partition Museum in Amritsar captures the harrowing experiences of the Partition of India in 1947. Through artifacts, personal stories, and multimedia exhibits, the museum recounts one of the largest mass migrations in history. Visitors gain a deeper understanding of the human cost of Partition, as well as the resilience and strength of those affected. It serves as a crucial archive for preserving this significant chapter of South Asian history.",
        imagePath: "assets/Amritsar/partition_museum_outro.jpg",
        isAssetImage: true,
      ),
// chandigarh
      PlaceModel(
          id: 6,
          placeName: "Sukhna Lake",
          description:
              "Man-made lake offering boating, gardens & a scenic backdrop.",
          cityId: 2,
          longDescription: "Sukhna Lake in Chandigarh is a picturesque man-made reservoir, offering a tranquil escape from city life. Surrounded by lush greenery, it provides a perfect setting for leisure activities such as boating, walking, and bird-watching. The lake is a hub for fitness enthusiasts and nature lovers alike, while its serene waters reflect the changing hues of the sky, creating a breathtaking view. Sukhna Lake also hosts several cultural events and festivals throughout the year.",
          imagePath: "assets/chandigarh/sukhna_lake_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 7,
          placeName: "Rock Garden",
          description: "Unique sculpted garden made from recycled materials.",
          cityId: 2,
          longDescription: "The Rock Garden of Chandigarh is a unique artistic marvel created by Nek Chand. This sprawling garden features sculptures and installations crafted from recycled and discarded materials like ceramics, bangles, and industrial waste. The labyrinthine pathways, waterfalls, and amphitheaters add to its charm, making it a must-visit attraction. It stands as a testament to the creative potential of reuse, blending art with sustainability.",
          imagePath: "assets/chandigarh/rock_garden_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 8,
          placeName: "Open Hand Monument",
          description:
              "Iconic symbol of Chandigarh, representing peace & unity.",
          cityId: 2,
          longDescription: "The Open Hand Monument in Chandigarh, designed by Le Corbusier, is an iconic symbol of peace and unity. This massive metal structure, shaped like a hand, rotates with the wind, representing openness to ideas and universal harmony. Situated in the Capitol Complex, the monument reflects Chandigarh’s modernist architectural ethos. It serves as a beacon of hope, promoting cooperation and understanding in a diverse world.",
          imagePath: "assets/chandigarh/handmonument_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 9,
          placeName: "Museum of Art & Culture",
          description: "Houses a collection of Indian art & artifacts.",
          cityId: 2,
          longDescription: "The Museum of Art & Culture in Chandigarh houses a rich collection of Indian art, including ancient sculptures, miniature paintings, and modern artworks. The museum offers visitors a glimpse into the region's diverse cultural heritage. Special exhibitions and interactive sessions make it an educational experience for all age groups. Its well-curated displays and serene ambiance provide an enriching journey through India’s artistic evolution.",
          imagePath: "assets/chandigarh/museum_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 10,
          placeName: "Zakir Hussain Rose Garden",
          description:
              "Largest rose garden in Asia, boasting over 16,000 rose varieties.",
          cityId: 2,
          longDescription: "Zakir Hussain Rose Garden in Chandigarh is Asia’s largest rose garden, sprawling over 30 acres. It boasts an impressive collection of over 16,000 rose varieties, along with other medicinal and decorative plants. The garden is a visual treat, especially during the annual Rose Festival, which features cultural performances, flower competitions, and stalls. It's a paradise for nature lovers and a peaceful retreat for those seeking relaxation amidst fragrant blooms.",
          imagePath: "assets/chandigarh/zakhir_husen_garden.jpg",
          isAssetImage: true),

// Patiala
      PlaceModel(
          id: 11,
          placeName: "Qila Mubarak",
          description: "17th-century fort showcasing Mughal architecture.",
          cityId: 3,
          longDescription: "Qila Mubarak in Patiala is a historic 17th-century fort showcasing the grandeur of Mughal and Sikh architectural styles. The complex includes the main palace, courtyards, and a stunning Durbar Hall with intricate frescoes and mirrorwork. Qila Mubarak serves as a vital link to Punjab’s royal history, offering insights into its rich cultural legacy. Visitors can explore the fort's imposing gates, secret passages, and artifacts from the royal era.",
          imagePath: "assets/patiala/qila_mubarak_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 12,
          placeName: "Baradari Gardens",
          description:
              "Mughal-era terraced gardens with fountains & pavilions.",
          cityId: 3,
          longDescription: "Baradari Gardens in Patiala is a serene Mughal-era garden featuring lush lawns, fountains, and colonial-era structures. Originally designed as a leisure space for the royal family, it now serves as a popular spot for locals and tourists. The garden's name derives from the 12-door pavilion at its center, which offers a panoramic view of the surroundings. Its vibrant flora and peaceful ambiance make it ideal for picnics and leisurely walks.",
          imagePath: "assets/patiala/baradari_gardens_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 13,
          placeName: "National Museum of Sikh History",
          description:
              "Exhibits Sikh history & culture through artifacts & multimedia.",
          cityId: 3,
          longDescription: "The National Museum of Sikh History in Patiala showcases the rich heritage and spiritual journey of Sikhism. Through a vast collection of artifacts, manuscripts, and multimedia exhibits, it narrates key events in Sikh history, including the lives of the ten Gurus and the formation of the Khalsa. The museum provides an immersive experience, offering visitors a deeper understanding of Sikh values, culture, and their impact on Indian history.",
          imagePath:
              "assets/patiala/international-sikh-museum_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 14,
          placeName: "Sheesh Mahal",
          description: "Palace known for its intricate mirror work & frescoes.",
          cityId: 3,
          longDescription: "Sheesh Mahal in Patiala is a stunning palace renowned for its intricate mirror work and colorful frescoes. Built during the reign of Maharaja Narinder Singh, the palace reflects the grandeur of the royal era. It houses a museum displaying rare artifacts, including a gallery dedicated to miniature paintings. The Sheesh Mahal’s beauty and historical significance make it a key attraction for history enthusiasts and art lovers.",
          imagePath: "assets/patiala/sheesh_mahal_patiala.jpg",
          isAssetImage: true),
// Annand pur sahib

      PlaceModel(
          id: 15,
          placeName: "Takht Sri Keshgarh Sahib",
          description:
              "Holiest Gurudwara for Sikhs, commemorating the Khalsa Panth.",
          cityId: 4,
          longDescription: "Takht Sri Keshgarh Sahib, located in Anandpur Sahib, is one of the five Takhts, or seats of authority, in Sikhism. It holds immense religious significance as the birthplace of the Khalsa Panth. The Gurudwara’s serene ambiance, coupled with its historical importance, attracts pilgrims and tourists alike. Its intricate architecture and spiritual aura offer a profound experience of devotion and peace.",
          imagePath: "assets/anandpursahib/takhtshri_keshgarh_outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 16,
          placeName: "Virasat-e-Khalsa",
          description: "Interactive museum showcasing Sikh history & culture.",
          cityId: 4,
          longDescription: "Virasat-e-Khalsa is an interactive museum in Anandpur Sahib that celebrates Sikh history and culture. Designed with modern architecture, the museum uses innovative exhibits, including audio-visual displays, to narrate the story of Sikhism from its inception to the present. It provides a deep and engaging experience for visitors, highlighting the religion’s core values and its significant contributions to humanity.",
          imagePath: "assets/anandpursahib/virasat-e-khalsa-outro.jpg",
          isAssetImage: true),
      PlaceModel(
          id: 17,
          placeName: "Anandpur Sahib Fort",
          description: "Historical fort associated with Sikh Gurus.",
          cityId: 4,
          longDescription: "Virasat-e-Khalsa is an interactive museum in Anandpur Sahib that celebrates Sikh history and culture. Designed with modern architecture, the museum uses innovative exhibits, including audio-visual displays, to narrate the story of Sikhism from its inception to the present. It provides a deep and engaging experience for visitors, highlighting the religion’s core values and its significant contributions to humanity.",
          imagePath: "assets/anandpursahib/anandpur_sahib_outro.jpg",
          isAssetImage: true),
    ]);

    initializePlacesByCity();
  }

  initializePlacesByCity() {
    for (PlaceModel place in allPlaces) {
      placesByCity.putIfAbsent(place.cityId, () => []);
      placesByCity[place.cityId]!.add(place);
    }
  }

  String getHeroTag({required PlaceModel place}) {
    return "${place.id}-${place.placeName}";
  }
}
