import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gt_food/menuIcon.dart';
import 'package:gt_food/model.dart';
import 'package:flutter/material.dart' hide Icon;

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
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text("More info food"),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ));
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
}
