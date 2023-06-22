import 'dart:collection';

import 'package:gt_food/model.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final Day menuDay;
  Menu(this.menuDay);

  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  HashMap<HallLocation, List<MenuItem>> _menuItems = HashMap();

  //TODO: don't reuse code
  void setMenuItems() {
    // get all menu items for the current day
    List<MenuItem> _rawMenuItems = widget.menuDay.menuItems;

    // populate menu items hashmap
    HallLocation currentKey = HallLocation.EMPTY;
    for (MenuItem m in _rawMenuItems) {
      if (m.isSectionTitle) {
        currentKey = m.text!;
        _menuItems.putIfAbsent(currentKey, () => <MenuItem>[]);
      } else {
        _menuItems[currentKey]!.add(m);
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
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                      return Container(
                        height: 50,
                        child: Center(
                            child: Text(_menuItems[key]![index].food!.name)),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return VerticalDivider(
                        thickness: 3.0,
                      );
                    },
                  ),
                ),
              );
            });
  }
}
