import 'package:flutter/material.dart';

import 'heroo2.dart';

class Heroo extends StatefulWidget {
  @override
  _HerooState createState() => _HerooState();
}

class _HerooState extends State<Heroo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Hero(
            tag: "hero",
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Heroo2();
                  }));
                },
                child: FlutterLogo(
                  size: 100,
                )),
          ),
        ],
      ),
    );
  }
}
