// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:gt_food/api_service.dart';
import 'package:gt_food/meal_picker.dart';
import 'package:gt_food/menuIcon.dart';
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
      ValueNotifier<String>(DiningHall.brittain),
      ValueNotifier<String>(Meal.breakfast),
      ValueNotifier<DateTime>(DateTime.now()));

  Future<void> _refreshModel() async {
    model = await ApiService.getDiningHallMenu(_menuURL);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Stack(
          children: [
            Column(children: [
              SafeArea(bottom: false, child: Calendar(_menuURL.dateTime)),
              AnimatedBuilder(
                animation: Listenable.merge(
                    [_menuURL.dateTime, _menuURL.meal, _menuURL.diningHall]),
                builder: (BuildContext context, _) {
                  return FutureBuilder<void>(
                    future: _refreshModel(),
                    builder:
                        (BuildContext context, AsyncSnapshot<void> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Expanded(
                            child: Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ));
                      } else {
                        if (model == null) {
                          return const Expanded(
                              child: Align(
                            alignment: Alignment.center,
                            child: Text('No menu available'),
                          ));
                        }
                        return Expanded(
                          child:
                              Menu(model!.getMenuDay(_menuURL.dateTime.value)),
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 45,
                child: BottomTab(_menuURL.diningHall),
              ),
            ]),
            Positioned(
              bottom: 50,
              left: 5,
              child: MealPicker(_menuURL.meal),
            ),
          ],
        ),
      )),
    );
  }
}
