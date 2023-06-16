import 'package:flutter/material.dart';
import 'package:gt_food/model.dart';
import 'package:gt_food/api_service.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter/src/widgets/icon.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Calendar(),
              SizedBox(height: 100, child: Home()),
              SizedBox(height: 100, child: AppBar()),
            ],
          ),
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
      print("Value changed: " + _controller.value.toString());
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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Model? _model;
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

class AppBar extends StatelessWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    const int tabsCount = 3;

    return DefaultTabController(
        length: tabsCount,
        child: Scaffold(
            appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: colorScheme.primary,
            child: SafeArea(
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(
                          icon: Image.asset(
                        'assets/images/brittain.jpg',
                        width: 30,
                        height: 30,
                      )),
                      Tab(
                          icon: Image.asset(
                        'assets/images/nav.jpg',
                        width: 30,
                        height: 30,
                      )),
                      Tab(
                          icon: Image.asset(
                        'assets/images/willage.jpg',
                        width: 30,
                        height: 30,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}

// class AppBar extends StatefulWidget {
//   const AppBar({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _AppBarState();
// }

// class _AppBarState extends State<AppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       color: Colors.red,
//       child: Row(
//         children: [
//           IconButton(
//             onPressed: () {},
//             icon: const Text("First option"),
//           ),
//           const Spacer(),
//           IconButton(
//             onPressed: () {},
//             icon: const Text("Second option"),
//           ),
//         ],
//       ),
//     );
//   }
// }
