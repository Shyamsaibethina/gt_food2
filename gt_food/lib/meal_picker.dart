import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MealPicker extends StatefulWidget {
  final ValueNotifier<String> meal;

  const MealPicker(this.meal);

  @override
  State<StatefulWidget> createState() => _MealPickerState();
}

class _MealPickerState extends State<MealPicker> {
  final List<String> _meals = <String>['Breakfast', 'Lunch', 'Dinner'];
  String get meal => widget.meal.value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: CupertinoPicker(
      itemExtent: 64,
      children: [
        for (final meal in _meals)
          Center(
            child: Text(
              meal,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: const Color(0xFF5FA8D3)),
            ),
          ),
      ],
      onSelectedItemChanged: (int index) {
        widget.meal.value = _meals[index].toLowerCase();
      },
    ));
    // return Container(
    //   height: 50,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: _meals.length,
    //     itemBuilder: (context, index) {
    //       final String currentMeal = _meals[index];
    //       return GestureDetector(
    //         onTap: () {
    //           widget.meal.value = currentMeal.toLowerCase();
    //         },
    //         child: Container(
    //           width: 100,
    //           decoration: BoxDecoration(
    //             color: currentMeal == meal
    //                 ? const Color(0xFF5FA8D3)
    //                 : Colors.transparent,
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //           child: Center(
    //             child: Text(
    //               currentMeal,
    //               style: theme.textTheme.bodyMedium!.copyWith(
    //                 color: currentMeal == meal
    //                     ? Colors.white
    //                     : const Color(0xFF5FA8D3),
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
