import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:the_punjab_tourism/constants/app_constants.dart';
import 'package:the_punjab_tourism/controllers/binding/initial_binding.dart';
import 'package:the_punjab_tourism/ui/cities_ui.dart';

void main() {
  Gemini.init(apiKey: AppConstants.GEMINI_API);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      title: 'The Punjab Tourism',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        useMaterial3: true,
      ),
      home: const HomeUI(),
    );
  }
}