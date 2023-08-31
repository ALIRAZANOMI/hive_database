import 'package:flutter/material.dart';

import 'fadeanimation.dart';

class Animatedcrossfade extends StatefulWidget {
  @override
  _AnimatedcrossfadeState createState() => _AnimatedcrossfadeState();
}

class _AnimatedcrossfadeState extends State<Animatedcrossfade> {
  var _bool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _bool = !_bool;
                });
              },
              child: Text("Switch")),
          AnimatedCrossFade(
            excludeBottomFocus: false,
            firstCurve: Curves.decelerate,
            alignment: Alignment.bottomLeft,
            firstChild: Image.asset("assets/images/1.png"),
            secondChild: Image.asset("assets/images/2.png"),
            crossFadeState:
                _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 1000),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return FadeTransitionDemo();
                }));
              },
              child: Text("Fade Transition"))
        ],
      ),
    );
  }
}
