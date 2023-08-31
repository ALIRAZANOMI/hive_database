import 'package:flutter/material.dart';

class Heroo2 extends StatefulWidget {

  @override
  _Heroo2State createState() => _Heroo2State();
}

class _Heroo2State extends State<Heroo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: "hero", child: GestureDetector(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return  }));
          },
          child: FlutterLogo(size: 400,)),


      ),
    );
  }
}
