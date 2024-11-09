import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:the_punjab_tourism/models/ai_input_model.dart';
import 'package:the_punjab_tourism/models/itinerary_model.dart';

class AiController extends GetxController {
  TextEditingController numberOfDays = TextEditingController();

  final gemini = Gemini.instance;

  Future<Itinerary?> getItinerary({required AiInputModel input}) async {
    try {
      log('itnimary ai call');
      Candidates? candidates = await gemini.text(_generatePrompt(input: input),
          modelName: 'models/gemini-1.5-flash');
      if (candidates != null) {
        String? output = candidates.output;
        if (output != null) {
          output = output.substring(7, output.length - 3);
          Map<String, dynamic> data = jsonDecode(output);
          numberOfDays.clear();
          return Itinerary.fromMap(data);
        }
      }
    } catch (e) {
      log("error occured while generating response $e");
    }
  }

  String _generatePrompt({required AiInputModel input}) {
    return '''"You are a travel guide, a detailed Punjab itinerary planner.
      User is travelling to ${input.city} city, for ${input.days} days      
      here, days means the number of days they are staying in that city.

      Like if I am staying in 'Amritsar', and staying for '2 days', so this means I want to explore the 'Amritsar' for 2 days, then you need to provide the itinerary for 2 days.

      Points to consider, while generating the output:
      1. Don't repeat the place in total days
      2. Try to cover nearest places in a day
      3. Guide user properly
      4. Don't go outside the city, only show places inside that city
      5. Provide places for all the times (MORNING, AFTERNOON, EVENING, NIGHT) - compulsory and output must be in the same order

      Things to remember in output:
      1. the 'day_<int>' means, the day number, like day 1 means 'day_1'
      2. 'place_name' and 'place_description' is the place you are suggesting the user to visit
      3. 'what_to_explore' must contain a short points, in a list format, telling user what to explore in that place
      4. 'preffered_time' is when you are suggesting the user to visit      

      The OUTPUT MUST RETURN ONLY JSON and NO OTHER CHARACTER:
      {
        'day_<int>': [
          {            
            'place_name':<string>,
            'place_description':<string>,
            'what_to_explore':List<string>,
            'preffered_time': (MORNING or AFTERNOON or EVENING or NIGHT),
          }
        ]                  
      } 
      ''';
  }
}
