import 'package:flutter/material.dart';

class ApiConstants {
  static String baseUrl =
      "https://techdining.api.nutrislice.com/menu/api/weeks/school/";
  static String diningHall = "north-ave-dining-hall"; //brittain, west-village
  static String meal = "lunch"; //breakfast, lunch, dinner
  static String date = "2023/6/10"; //YYYY/M/DD
}

class DiningHall {
  static const String brittain = "brittain";
  static const String northAve = "north-ave-dining-hall";
  static const String westVillage = "west-village";
}

class Meal {
  static const String breakfast = "breakfast";
  static const String lunch = "lunch";
  static const String dinner = "dinner";
}

class MyPlateColor {
  static const Color dairy = Color.fromARGB(255, 80, 131, 197);
  static const Color fruits = Color.fromARGB(255, 197, 52, 47);
  static const Color vegetables = Color.fromARGB(255, 131, 181, 84);
  static const Color protein = Color.fromARGB(255, 91, 73, 143);
}
