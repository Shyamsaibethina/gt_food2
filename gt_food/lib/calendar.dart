import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';

class Calendar extends StatefulWidget {
  final ValueNotifier<DateTime> dateTime;

  const Calendar(this.dateTime);

  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final AdvancedCalendarController _controller =
      AdvancedCalendarController.today();
  AdvancedCalendarController get controller => _controller;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      widget.dateTime.value = _controller.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: theme.textTheme.copyWith(
          titleMedium: theme.textTheme.titleMedium!.copyWith(
            fontSize: 15,
            color: const Color(0xFF5FA8D3),
          ),
          bodyLarge: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 15,
            color: Colors.black54,
          ),
          bodyMedium: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
        primaryColor: const Color(0xFF5FA8D3),
        highlightColor: const Color(0xFFFCD0A1),
      ),
      child: AdvancedCalendar(
        controller: _controller,
        events: const [],
        preloadMonthViewAmount: 3,
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
