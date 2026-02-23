import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'onboarding_screen.dart';
import 'blog_splash_screen.dart';
import 'city_info_splash_screen.dart';
import 'restaurant_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// PAGE VIEW
          PageView(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              /// -------- PAGE 1: SPLASH --------
              SafeArea(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/city_logo.png',
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Nellore",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFFFC107),
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "Explorer",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Explore Your City",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              BlogSplashScreen(),
              CityInfoSplashScreen(),
              RestaurantSplashScreen(),
              OnboardingScreen(),
            ],
          ),

          /// DOT INDICATOR (ONLY FOR FIRST 4 PAGES)
          if (currentPage < 4)
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 4, // ONLY 4 DOTS
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xFFFFC107),
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}