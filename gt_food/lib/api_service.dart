import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:gt_food/constants.dart';
import 'package:gt_food/model.dart';

class ApiService {
  Future<Model?> getDiningHallMenu(
      String diningHall, String meal, DateTime dateTime) async {
    try {
      final response = await http.get(Uri.parse(
          "${ApiConstants.baseUrl}$diningHall/menu-type/$meal/${dateTime.year}/${dateTime.month}/${dateTime.day}/?format=json"));

      if (response.statusCode == 200) {
        return modelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
