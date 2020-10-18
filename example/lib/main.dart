import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:platform_date_picker/platform_date_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform Date Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platform Aware Date Picker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text(
                date.month.toString() +
                    '/' +
                    date.day.toString() +
                    '/' +
                    date.year.toString(),
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: Text(
                formatTime(time),
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            MaterialButton(
              height: 70,
              minWidth: double.infinity,
              color: Colors.lightBlue,
              child: Text('Default Date Picker'),
              onPressed: () async {
                DateTime temp = await PlatformDatePicker.showDate(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 2),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 2),
                  builder: (context, child) => Theme(
                    data: ThemeData.light().copyWith(
                      primaryColor: const Color(0xFF8CE7F1),
                      accentColor: const Color(0xFF8CE7F1),
                      colorScheme:
                          ColorScheme.light(primary: const Color(0xFF8CE7F1)),
                      buttonTheme:
                          ButtonThemeData(textTheme: ButtonTextTheme.primary),
                    ),
                    child: child,
                  ),
                );
                if (temp != null) setState(() => date = temp);
              },
            ),
            MaterialButton(
              height: 70,
              minWidth: double.infinity,
              color: Colors.blueAccent,
              child: Text('Force Cupertino Date Picker'),
              onPressed: () async {
                DateTime temp = await PlatformDatePicker.showDate(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 2),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 2),
                  showCupertino: true,
                );
                if (temp != null) setState(() => date = temp);
              },
            ),
            MaterialButton(
              height: 70,
              minWidth: double.infinity,
              color: Colors.teal,
              child: Text('Different Height Date Picker'),
              onPressed: () async {
                DateTime temp = await PlatformDatePicker.showDate(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 2),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 2),
                  showCupertino: true,
                  height: 100,
                );
                if (temp != null) setState(() => date = temp);
              },
            ),
            MaterialButton(
              height: 70,
              minWidth: double.infinity,
              color: Colors.green,
              child: Text('Default Time Picker'),
              onPressed: () async {
                TimeOfDay temp = await PlatformDatePicker.showTime(
                  context: context,
                  initialTime: time,
                );
                if (temp != null) setState(() => time = temp);
              },
            ),
            MaterialButton(
              height: 70,
              minWidth: double.infinity,
              color: Colors.deepPurple,
              child: Text('Force Cupertino Time Picker'),
              onPressed: () async {
                TimeOfDay temp = await PlatformDatePicker.showTime(
                  context: context,
                  initialTime: time,
                  showCupertino: true,
                );
                if (temp != null) setState(() => time = temp);
              },
            ),
            MaterialButton(
              height: 70,
              minWidth: double.infinity,
              color: Colors.blue[700],
              child: Text('Different Height Time Picker'),
              onPressed: () async {
                TimeOfDay temp = await PlatformDatePicker.showTime(
                  context: context,
                  initialTime: time,
                  showCupertino: true,
                  height: 100,
                );
                if (temp != null) setState(() => time = temp);
              },
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(TimeOfDay time) {
    DateTime current = new DateTime.now();
    current = DateTime(
        current.year, current.month, current.day, time.hour, time.minute);
    DateFormat format = DateFormat.jm();
    return format.format(current);
  }
}
