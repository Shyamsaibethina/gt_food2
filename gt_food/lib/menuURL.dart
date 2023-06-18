import 'package:flutter/material.dart';
import 'package:gt_food/constants.dart';

class MenuURL {
  ValueNotifier<String> diningHall;
  ValueNotifier<String> meal;
  ValueNotifier<DateTime> dateTime;

  MenuURL(this.diningHall, this.meal, this.dateTime);

  Uri getURL() {
    return Uri.parse(
        "${ApiConstants.baseUrl}${diningHall.value}/menu-type/${meal.value}/${dateTime.value.year}/${dateTime.value.month}/${dateTime.value.day}/?format=json");
  }
}
