import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER WITH PROFILE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DISCOVER",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Nellore",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFFFC107),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  /// PROFILE SECTION
                  GestureDetector(
                    onTap: () {
                      // Navigate to profile screen
                    },
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Color(0xFFFFC107),
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Stella", // 👈 Replace with dynamic name later
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// FEATURED STORIES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Stories",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View All →",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFFFC107),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 350, // increased to prevent overflow
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    FeaturedCard(
                      title: "Top 10 Weekend Getaways",
                      description:
                      "Explore the hidden gems and serene landscapes surrounding Nellore.",
                      tag: "TRAVEL GUIDE",
                      imagePath: "assets/images/travel.jpg",
                    ),
                    SizedBox(width: 16),
                    FeaturedCard(
                      title: "History of Nellore",
                      description:
                      "A deep dive into the cultural lifeline of the city.",
                      tag: "HISTORY",
                      imagePath: "assets/images/history.jpg",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// LATEST UPDATES
              Text(
                "Latest Updates",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              const LatestUpdateCard(
                title: "New Food Festival This Weekend!",
                subtitle: "Experience the best street food in Nellore.",
              ),

              const SizedBox(height: 12),

              const LatestUpdateCard(
                title: "Beach Cleanup Drive",
                subtitle: "Join the community initiative this Sunday.",
              ),
              const SizedBox(height: 12),

              const LatestUpdateCard(
                title: "Weather Update",
                subtitle: "Expect moderate showers across Nellore this weekend.",
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }


}

/// FEATURED CARD WITH IMAGE
class FeaturedCard extends StatelessWidget {
  final String title;
  final String description;
  final String tag;
  final String imagePath;

  const FeaturedCard({
    super.key,
    required this.title,
    required this.description,
    required this.tag,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC107),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  description,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 16),

                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFFFC107)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Read More",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFFFC107),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// LATEST UPDATE CARD
class LatestUpdateCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const LatestUpdateCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.notifications, color: Color(0xFFFFC107)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}