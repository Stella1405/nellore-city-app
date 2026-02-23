import 'package:flutter/material.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [

            /// Top Bar
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.arrow_back, color: Colors.white),
                const SizedBox(width: 12),
                const Text(
                  "Restaurants & Places",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.tune,
                      color: Colors.amber),
                )
              ],
            ),

            const SizedBox(height: 20),

            /// Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.amber),
                  SizedBox(width: 10),
                  Text(
                    "Search for restaurants, cafes, street food",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  filterChip("All", true),
                  filterChip("Veg", false),
                  filterChip("Non-Veg", false),
                  filterChip("Cafes", false),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Featured Title
            Row(
              children: const [
                Text(
                  "Featured Places",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Spacer(),
                Text(
                  "View all",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Cards
            restaurantCard(
              image: "assets/images/kritunga.jpeg",
              name: "Kritunga Restaurant",
              details: "Indian • Fine Dining • \$\$\$",
              distance: "1.2 km",
              rating: "4.0",
              isOpen: true,
            ),

            const SizedBox(height: 20),

            restaurantCard(
              image: "assets/images/ministers.jpeg",
              name: "Ministers Cafe",
              details: "Cafe • Desserts • \$\$",
              distance: "0.8 km",
              rating: "4.2",
              isOpen: true,
            ),

            const SizedBox(height: 20),

            restaurantCard(
              image: "assets/images/pizza.jpg",
              name: "G Pizzeria",
              details: "Italian • Casual • \$\$",
              distance: "2.5 km",
              rating: "4.4",
              isOpen: false,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// Filter Chip
  Widget filterChip(String text, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.amber : const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  /// Restaurant Card
  Widget restaurantCard({
    required String image,
    required String name,
    required String details,
    required String distance,
    required String rating,
    required bool isOpen,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              /// Rating Badge
              Positioned(
                top: 15,
                right: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star,
                          color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),

              /// Open/Closed Badge
              Positioned(
                bottom: 15,
                left: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isOpen
                        ? Colors.amber
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isOpen ? "OPEN NOW" : "CLOSED",
                    style: TextStyle(
                        color: isOpen
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

          /// Bottom Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        details,
                        style:
                        const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Text(
                  distance,
                  style:
                  const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}