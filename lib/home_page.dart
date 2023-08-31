import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// refrence our box
  final _myBox = Hive.box("MyBox");

  /// write data
  void WriteData() {
    _myBox.put(1, "Ali");
  }

  /// read data

  void ReadData() {
    print(_myBox.get(1));
  }

  /// delete data
  void DeleteData() {
    _myBox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MaterialButton(
              color: Colors.green,
              onPressed: WriteData,
              child: Text("Write"),
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: ReadData,
              child: Text("Read"),
            ),
            MaterialButton(
              color: Colors.yellow,
              onPressed: DeleteData,
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
