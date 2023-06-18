// ignore_for_file: avoid_print

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:gt_food/tab.dart';
import 'package:gt_food/menu.dart';
import 'package:gt_food/calendar.dart';

void main() => runApp(const MyApp());
var diningHall = 'west-village';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: ColorfulSafeArea(
            color: Color(0xFF5FA8D3),
            child: Column(
              children: [
                Calendar(),
                Expanded(child: Menu()),
                SizedBox(height: 45, child: BottomTab()),
              ],
            )),
      ),
    );
  }
}
