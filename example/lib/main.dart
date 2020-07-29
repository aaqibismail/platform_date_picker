import 'package:flutter/material.dart';
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
            MaterialButton(
              height: 70,
              minWidth: double.infinity,
              color: Colors.lightBlue,
              child: Text('Regular'),
              onPressed: () async {
                DateTime temp = await PlatformDatePicker.show(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 2),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 2),
                );
                if (temp != null) setState(() => date = temp);
              },
            ),
            MaterialButton(
              height: 70,
              minWidth: double.infinity,
              color: Colors.blueAccent,
              child: Text('Force Cupertino'),
              onPressed: () async {
                DateTime temp = await PlatformDatePicker.show(
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
              child: Text('Different Height'),
              onPressed: () async {
                DateTime temp = await PlatformDatePicker.show(
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
          ],
        ),
      ),
    );
  }
}
