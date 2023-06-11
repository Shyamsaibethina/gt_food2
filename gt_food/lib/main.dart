import 'package:flutter/material.dart';
import 'package:gt_food/model.dart';
import 'package:gt_food/api_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Column(
          children: [
            Text('Hello World'),
            SizedBox(height: 100, child: Home()),
          ],
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
  late Model? _model = null;
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
