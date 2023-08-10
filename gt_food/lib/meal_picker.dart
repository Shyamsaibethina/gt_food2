import 'package:flutter/material.dart';

class MealPicker extends StatefulWidget {
  final ValueNotifier<String> meal;

  const MealPicker(this.meal, {super.key});

  @override
  State<StatefulWidget> createState() => _MealPickerState();
}

class _MealPickerState extends State<MealPicker> {
  String get meal => widget.meal.value;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (meal == "breakfast") {
            setState(() {
              widget.meal.value = "lunch";
            });
          } else if (meal == "lunch") {
            setState(() {
              widget.meal.value = "dinner";
            });
          } else {
            setState(() {
              widget.meal.value = "breakfast";
            });
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5FA8D3),
          foregroundColor: Colors.black,
          side: const BorderSide(color: Colors.black, width: 2),
        ),
        child: Text(widget.meal.value.toUpperCase()));
    // return Center(
    //     child: CupertinoPicker(
    //   itemExtent: 64,
    //   children: [
    //     for (final meal in _meals)
    //       Center(
    //         child: Text(
    //           meal,
    //           style: theme.textTheme.bodyMedium!.copyWith(
    //               fontSize: 30,
    //               color: const Color(0xFF5FA8D3),
    //               fontWeight: FontWeight.w600),
    //         ),
    //       ),
    //   ],
    //   onSelectedItemChanged: (int index) {
    //     widget.meal.value = _meals[index].toLowerCase();
    //   },
    // ));
  }
}
