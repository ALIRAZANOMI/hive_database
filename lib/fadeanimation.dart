import 'package:flutter/material.dart';

import 'heroo.dart';

class FadeTransitionDemo extends StatefulWidget {
  _FadeTransitionDemoState createState() => _FadeTransitionDemoState();
}

class _FadeTransitionDemoState extends State<FadeTransitionDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          ' FadeTransition',
        ),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/1.png"),
           SizedBox(height: 50,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return Heroo(); }));
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return Heroo(); }));
              }, child: Text("Hero Widget"))
            ],
          ),
        ),
      ),
    );
  }
}
