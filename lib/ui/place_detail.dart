import 'package:flutter/material.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://your-image-url.jpg', // Replace with actual URL
              fit: BoxFit.cover,
            ),
          ),
          // Back Button
          Positioned(
            top: 40,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          // Content Area
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title and Rating
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lighthouse Cabo da Roca',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.orange),
                              const Text(
                                '5.0',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                              const Text('151 reviews'),
                            ],
                          ),
                        ],
                      ),
                      // Avatar Row
                      Stack(
                        children: [
                          ...List.generate(4, (index) {
                            return Positioned(
                              left: index * 20.0,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage: NetworkImage(
                                    'https://your-avatar-url-$index.jpg'),
                              ),
                            );
                          }),
                          Positioned(
                            left: 80.0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey.shade200,
                              child: const Text('+6'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Tab Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Overview', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Reviews', style: TextStyle(color: Colors.grey)),
                      Text('Details', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Info Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.location_on),
                      Text('Portugal', style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.price_change),
                      Text('80€', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Cabo da Roca or Cape Roca is a cape which forms the westernmost point of mainland Portugal.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  // Book Now Button
                  ElevatedButton(
                    onPressed: () {
                      // Booking action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text('Book Now', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
