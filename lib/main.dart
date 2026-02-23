import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City Explorer',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFFC107),

        // Global cursor color
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFFFC107),
          // Yellow cursor
          selectionColor: Color(0x33FFC107),
          // Optional: yellow highlight when selecting text
          selectionHandleColor: Color(0xFFFFC107),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}