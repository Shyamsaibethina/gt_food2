import 'package:flutter/material.dart';
import 'package:gt_food/model.dart';
import 'package:gt_food/api_service.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: Column(
          children: [
            Text('Hello World'),
            Calendar(),
            SizedBox(height: 100, child: Home()),
          ],
        ),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _controller = AdvancedCalendarController.today();

  AdvancedCalendarController get controller => _controller;

  //print the selected date using AdvancedCalendarController
  void _printSelectedDate() {
    print(_controller.value);
  }

  @override
  void initState() {
    super.initState();
    _printSelectedDate();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedCalendar(
      controller: _controller,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Model? _model;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    DateTime now = DateTime.now();
    _model =
        (await ApiService().getDiningHallMenu('west-village', 'lunch', now));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _model == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Text(_model?.startDate.toString() ?? 'null',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
    );
  }
}
