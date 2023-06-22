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
            SafeArea(bottom: false, child: Calendar(_menuURL.dateTime)),
            ValueListenableBuilder2(
              first: _menuURL.dateTime,
              second: _menuURL.diningHall,
              builder: (context, dateTime, diningHall) {
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
                      if (model!.getMenuDay(_menuURL.dateTime.value) == null) {
                        return const Expanded(
                            child: Align(
                          alignment: Alignment.center,
                          child: Text('No menu available'),
                        ));
                      }
                      return Expanded(
                        child:
                            Menu(model!.getMenuDay(_menuURL.dateTime.value)!),
                      );
                    }
                  },
                );
              },
            ),
            SafeArea(
                child: SizedBox(
                    height: 45, child: BottomTab(_menuURL.diningHall))),
          ],
        ),
      ),
    );
  }
}

class ValueListenableBuilder2<A, B> extends StatelessWidget {
  const ValueListenableBuilder2({
    required this.first,
    required this.second,
    Key? key,
    required this.builder,
  }) : super(key: key);

  final ValueNotifier<A> first;
  final ValueNotifier<B> second;
  final Widget Function(BuildContext context, A a, B b) builder;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<A>(
        valueListenable: first,
        builder: (_, a, __) {
          return ValueListenableBuilder<B>(
            valueListenable: second,
            builder: (context, b, __) {
              return builder(context, a, b);
            },
          );
        },
      );
}
