import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final AdvancedCalendarController _controller =
      AdvancedCalendarController.today();
  AdvancedCalendarController get controller => _controller;

  //print the selected date using AdvancedCalendarController
  void _printSelectedDate() {
    print(_controller.value);
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      print("Value changed: ${_controller.value}");
    });
    _printSelectedDate();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: theme.textTheme.copyWith(
          titleMedium: theme.textTheme.titleMedium!.copyWith(
            fontSize: 12,
            color: theme.colorScheme.secondary,
          ),
          bodyLarge: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 12,
            color: Colors.black54,
          ),
          bodyMedium: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
        primaryColor: Colors.red,
        highlightColor: Colors.yellow,
        disabledColor: Colors.green,
      ),
      child: AdvancedCalendar(
        controller: _controller,
        events: [],
        calendarTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.3125,
          letterSpacing: 0,
        ),
      ),
    );
  }
}
