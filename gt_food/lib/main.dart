// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:gt_food/api_service.dart';
import 'package:gt_food/menuURL.dart';
import 'package:gt_food/model.dart';
import 'package:gt_food/tab.dart';
import 'package:gt_food/menu.dart';
import 'package:gt_food/calendar.dart';

import 'package:gt_food/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Model? model;
  final MenuURL _menuURL = MenuURL(
      ValueNotifier<String>(DiningHall.westVillage),
      ValueNotifier<String>(Meal.lunch),
      ValueNotifier<DateTime>(DateTime.now()));

  Future<void> _refreshModel() async {
    model = await ApiService.getDiningHallMenu(_menuURL);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: Column(
          children: [
            SafeArea(child: Calendar(_menuURL.dateTime)),
            ValueListenableBuilder<DateTime>(
              builder: (BuildContext context, DateTime value, Widget? child) {
                return FutureBuilder<void>(
                  future: _refreshModel(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return Expanded(
                        child: Menu(model!.getMenuDay(_menuURL.dateTime.value)),
                      );
                    }
                  },
                );
              },
              valueListenable: _menuURL.dateTime,
            ),
            const SafeArea(child: SizedBox(height: 45, child: BottomTab())),
          ],
        ),
      ),
    );
  }
}
