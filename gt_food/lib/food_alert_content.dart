import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gt_food/menuIcon.dart';
import 'package:gt_food/model.dart';
import 'package:flutter/material.dart' hide Icon;
import 'package:logger/logger.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FoodAlertContent extends StatelessWidget {
  HashMap<HallLocation, List<MenuItem>> menuItems;
  HashMap<int, List<MenuIcon>> menuIcons;
  HallLocation hallLocation;
  int index;

  FoodAlertContent(
      this.menuItems, this.menuIcons, this.hallLocation, this.index,
      {Key? key})
      : super(key: key);

  HashMap<String, double?> getNutritionInfo() {
    HashMap<String, double?> info = HashMap();
    info.addAll({
      "Calories": menuItems[hallLocation]![index]
          .food!
          .roundedNutritionInfo["calories"],
      "Total Fat":
          menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_fat"],
      "Saturated Fat": menuItems[hallLocation]![index]
          .food!
          .roundedNutritionInfo["g_saturated_fat"],
      "Trans Fat": menuItems[hallLocation]![index]
          .food!
          .roundedNutritionInfo["g_trans_fat"],
      "Total Cholesterol": menuItems[hallLocation]![index]
          .food!
          .roundedNutritionInfo["mg_cholesterol"],
      "Total Carbs":
          menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_carbs"],
      "Total Sugars":
          menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_sugar"],
      "Added Sugars": menuItems[hallLocation]![index]
          .food!
          .roundedNutritionInfo["g_added_sugar"],
      "Total Sodium": menuItems[hallLocation]![index]
          .food!
          .roundedNutritionInfo["mg_sodium"],
      "Total Potassium": menuItems[hallLocation]![index]
          .food!
          .roundedNutritionInfo["mg_potassium"],
      "Total Fiber":
          menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_fiber"],
      "Total Protein": menuItems[hallLocation]![index]
          .food!
          .roundedNutritionInfo["g_protein"],
      "Total Iron":
          menuItems[hallLocation]![index].food!.roundedNutritionInfo["mg_iron"],
      "Total Calcium": menuItems[hallLocation]![index]
          .food!
          .roundedNutritionInfo["mg_calcium"],
    });

    return info;
  }

  @override
  Widget build(BuildContext context) {
    HashMap<String, double?> nutritionInfo = getNutritionInfo();
    List<Widget> nutritionWidgets = [];
    for (String key in nutritionInfo.keys) {
      nutritionWidgets.add(
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("$key: ${nutritionInfo[key]}"),
              ),
              Text("0%"),
            ],
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: menuIcons[menuItems[hallLocation]![index].id] ?? [],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Daily Value",
              textAlign: TextAlign.right,
            )
          ],
        ),
        Container(
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              children: nutritionWidgets
            ),
          ),
        ),
        //...nutritionWidgets,
      ],
    );
  }

  Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
