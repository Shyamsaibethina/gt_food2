import 'dart:collection';

import 'package:gt_food/api_service.dart';
import 'package:gt_food/model.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  HashMap<HallLocation, List<MenuItem>> _menuItems = HashMap();

  @override
  void initState() {
    super.initState();
    _getMenuDay();
  }

  //TODO: don't reuse code
  void _getMenuDay() async {
    DateTime now = DateTime.now();
    Model? _model =
        (await ApiService().getDiningHallMenu('west-village', 'lunch', now));
    if (_model == null) {
      throw ArgumentError("could not get model");
    }

    // get all menu items for the current day
    List<MenuItem> _rawMenuItems = _model.days
        .firstWhere((element) => element.date.day == now.day)
        .menuItems;

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

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
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
                    itemCount: _menuItems[key]!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        child: Center(
                            child: Text(_menuItems[key]![index].food!.name)),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(thickness: 3.0);
                    },
                  ),
                ),
              );
            });
  }
}
