import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gt_food/menuIcon.dart';
import 'package:gt_food/model.dart';
import 'package:flutter/material.dart' hide Icon;
import 'package:logger/logger.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FoodCard extends StatelessWidget {
  HashMap<HallLocation, List<MenuItem>> menuItems;
  HashMap<int, List<MenuIcon>> menuIcons;
  HallLocation hallLocation;
  int index;

  FoodCard(this.menuItems, this.menuIcons, this.hallLocation, this.index,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _onAlertButtonPressed(context);
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFCD0A1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.fromBorderSide(BorderSide(
              color: Color(0xFFab3428),
              width: 2,
            )),
          ),
          width: 150,
          margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Text(
                    menuItems[hallLocation]![index].food!.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children:
                            (menuIcons[menuItems[hallLocation]![index].id] ??
                                    [])
                                .take(4)
                                .map((widget) {
                          return Center(
                              child: Transform.scale(scale: 1, child: widget));
                        }).toList() // Add ellipsis
                        ),
                    //)
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ((menuIcons[menuItems[hallLocation]![index].id] ?? [])
                              .length >
                          4)
                      ? const Text(
                          '...',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        )
                      : const SizedBox.shrink(),
                )
              ],
            ),
          ),
        ));
  }

  _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.info,
      title: menuItems[hallLocation]![index].food!.name,
      desc: menuItems[hallLocation]![index].food!.description.name,
      content: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: menuIcons[menuItems[hallLocation]![index].id] ?? [],
          ),
          Text(
              "Calories: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["calories"]}"),
          Text(
              "Total Fat: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_fat"]}"),
          Text(
              "Total Saturated Fat: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_saturated_fat"]}"),
          Text(
              "Total Trans Fat: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_trans_fat"]}"),
          Text(
              "Total Cholesterol: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["mg_cholesterol"]}"),
          Text(
              "Total Carbs: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_carbs"]}"),
          Text(
              "Total Sugars: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_sugar"]}"),
          Text(
              "Total Added Sugars: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_added_sugar"]}"),
          Text(
              "Total Sodium: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["mg_sodium"]}"),
          Text(
              "Total Potassium: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["mg_potassium"]}"),
          Text(
              "Total Fiber: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_fiber"]}"),
          Text(
              "Total Protein: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["g_protein"]}"),
          Text(
              "Total Iron: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["mg_iron"]}"),
          Text(
              "Total Calcium: ${menuItems[hallLocation]![index].food!.roundedNutritionInfo["mg_calcium"]}"),
          Text(
              "Serving Size: ${menuItems[hallLocation]![index].food!.servingSizeInfo.servingSizeUnit}"),
        ],
      ),
      alertAnimation: fadeAlertAnimation,
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          color: const Color(0xFF5FA8D3),
          child: const Text(
            "Done",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
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
