import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gt_food/menuIcon.dart';
import 'package:gt_food/model.dart';
import 'package:flutter/material.dart' hide Icon;
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
          ),
          width: 150,
          margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  menuItems[hallLocation]![index].food!.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: menuIcons[menuItems[hallLocation]![index].id]!,
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
            children: menuIcons[menuItems[hallLocation]![index].id]!,
          ),
          Text(
              "Calories: ${menuItems[hallLocation]![index].food!.aggregatedData.calories}"),
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
