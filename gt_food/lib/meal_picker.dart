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
              style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 30,
                  color: const Color(0xFF5FA8D3),
                  fontWeight: FontWeight.w600),
            ),
          ),
      ],
      onSelectedItemChanged: (int index) {
        widget.meal.value = _meals[index].toLowerCase();
      },
    ));
  }
}
