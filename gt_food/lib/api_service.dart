import 'dart:developer';

import 'package:gt_food/menuURL.dart';
import 'package:http/http.dart' as http;
import 'package:gt_food/model.dart';

class ApiService {
  static Future<Model?> getDiningHallMenu(MenuURL menuURL) async {
    try {
      print("Fetching model with URL: ${menuURL.getURL()}");
      final response = await http.get(menuURL.getURL());

      if (response.statusCode == 200) {
        return modelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
