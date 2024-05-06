import 'package:flutter/material.dart';



class CountDownScreen extends StatelessWidget {
  const CountDownScreen({Key? key}) : super(key: key);
  static const String routeName = 'CountDownScreen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CountDownPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CountDownPage extends StatefulWidget {
  const CountDownPage({super.key, required this.title});
  final String title;

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  DateTime birthday = DateTime(2024, 6, 8); // Set the birthday

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    Duration remainingTime = birthday.difference(currentDate);

    int months = remainingTime.inDays ~/ 30; // approximate months
    int remainingDays = remainingTime.inDays % 30;
    int hours = remainingTime.inHours % 24;

    return Scaffold(
      appBar: AppBar(
        title: Text('Geri Sayim'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Doğum gününe kalan süre:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$months ay $remainingDays gün $hours saat',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}