import 'dart:collection';

import 'package:gt_food/menuIcon.dart';
import 'package:gt_food/model.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart' hide Icon;
import 'package:gt_food/food_card.dart';

class Menu extends StatefulWidget {
  final Day menuDay;
  const Menu(this.menuDay, {super.key});

  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final HashMap<HallLocation, List<MenuItem>> _menuItems = HashMap();
  final HashMap<int, List<MenuIcon>> _menuIcons = HashMap();
  //TODO: don't reuse code
  void setMenuItems() {
    // get all menu items for the current day
    List<MenuItem> rawMenuItems = widget.menuDay.menuItems;

    // populate data structures
    HallLocation currentKey = HallLocation.EMPTY;
    for (MenuItem m in rawMenuItems) {
      if (m.isSectionTitle) {
        currentKey = m.text!;
        _menuItems.putIfAbsent(currentKey, () => <MenuItem>[]);
      } else {
        _menuItems[currentKey]!.add(m);
        for (Icon i in m.food!.icons.myplateIcons + m.food!.icons.foodIcons) {
          _menuIcons
              .putIfAbsent(m.id, () => <MenuIcon>[])
              .add(MenuIcon(i.sprite.className));
        }
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //TODO: remove debug code
    print(
        "Rebuilding menu widget with date: ${widget.menuDay.date.toIso8601String()}");

    setMenuItems();

    return _menuItems.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: _menuItems.length,
            itemBuilder: (context, index) {
              HallLocation key = _menuItems.keys.elementAt(index);
              return StickyHeader(
                header: Container(
                  height: 50.0,
                  color: Colors.blueGrey[700],
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    key.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                content: Container(
                  height: 200.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _menuItems[key]!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 50,
                        child: FoodCard(
                          _menuItems,
                          _menuIcons,
                          key,
                          index,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const VerticalDivider(
                        thickness: 0,
                      );
                    },
                  ),
                ),
              );
            });
  }
}
