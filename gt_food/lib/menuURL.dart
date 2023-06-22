import 'package:flutter/material.dart';
import 'package:gt_food/constants.dart';

class MenuURL {
  final ValueNotifier<String> _diningHall;
  final ValueNotifier<String> _meal;
  final ValueNotifier<DateTime> _dateTime;

  MenuURL(this._diningHall, this._meal, this._dateTime);

  ValueNotifier<String> get diningHall => _diningHall;
  ValueNotifier<String> get meal => _meal;
  ValueNotifier<DateTime> get dateTime => _dateTime;
  
  Uri getURL() {
    return Uri.parse(
        "${ApiConstants.baseUrl}${_diningHall.value}/menu-type/${_meal.value}/${_dateTime.value.year}/${_dateTime.value.month}/${_dateTime.value.day}/?format=json");
  }
}
