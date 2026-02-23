import 'package:flutter/material.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            const Text(
              "City Blogs",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),

            const SizedBox(height: 20),

            /// 🔍 SEARCH BAR (ADDED)
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search blogs...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),



            // Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoryChip("All", true),
                  categoryChip("Food", false),
                  categoryChip("Lifestyle", false),
                  categoryChip("Travel", false),
                  categoryChip("Updates", false),
                  categoryChip("History", false),
                ],
              ),
            ),

            const SizedBox(height: 20),

            blogCard(
              "Best Street Food in Nellore",
              "Discover the hidden gems of the city's evening markets...",
              "assets/images/food.jpeg",
              "Rahul K.",
              "OCT 24, 2025",
              "FOOD",
            ),

            const SizedBox(height: 20),

            blogCard(
              "Ancient Temples: A Journey",
              "Explore the architectural marvels that define our history...",
              "assets/images/temple.jpeg",
              "Sita M.",
              "OCT 22, 2025",
              "HISTORY",
            ),
              const SizedBox(height: 20),

              blogCard(
                "Weekend Gateway Near Nellore",
                "Escape the city bustle with these serene coastal destinations for a perfect weekend...",
                "assets/images/beach.jpg",
                "Stella S.",
                "Sept 01, 2025",
                "Travel",
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryChip(String title, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.amber : Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: isSelected ? Colors.black : Colors.white),
        ),
      ),
    );
  }

  Widget blogCard(String title, String desc, String imagePath,
      String author, String date, String category) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  imagePath,
                  height: 190, // 🔥 Increased image size
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12), // 🔥 Reduced padding (was 16)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "🔒 LOGIN TO READ FULL ARTICLE",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13), // 🔥 Slightly smaller text
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(author,
                        style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    Text(date,
                        style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}