import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gt_food/food_alert_content.dart';
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
    const alertStyle = AlertStyle(backgroundColor: Color(0xFF5FA8D3));
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.none,
      title: menuItems[hallLocation]![index].food!.name,
      desc: menuItems[hallLocation]![index].food!.description!.name,
      content: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: FoodAlertContent(menuItems, menuIcons, hallLocation, index),
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
