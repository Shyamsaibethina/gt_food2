import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:gt_food/constants.dart';
import 'package:gt_food/model.dart';
import 'dart:io';

class ApiService {
  Future<Model?> getDiningHallMenu(
      String diningHall, String meal, DateTime dateTime) async {
    try {
      print("before response");
      // create a response object from the url and wait for it to complete
      print(Uri.parse(ApiConstants.baseUrl +
          diningHall +
          "/menu-type/" +
          meal +
          "/" +
          dateTime.year.toString() +
          "/" +
          dateTime.month.toString() +
          "/" +
          dateTime.day.toString() +
          "/?format=json"));
      //   final response = await http
      //       .get(Uri.parse(ApiConstants.baseUrl +
      //           diningHall +
      //           "/menu-type/" +
      //           meal +
      //           "/" +
      //           dateTime.year.toString() +
      //           "/" +
      //           dateTime.month.toString() +
      //           "/" +
      //           dateTime.day.toString() +
      //           "/?format=json"))
      //       .timeout(
      //         const Duration(seconds: 5),
      //       );
      print("Timeout working");
      //   if (response.statusCode == 200) {
      //     return modelFromJson(response.body);
      //   }
      print(File('raw.txt').readAsStringSync());
      print('after reading file');
      return modelFromJson(File('raw.txt').readAsStringSync());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
