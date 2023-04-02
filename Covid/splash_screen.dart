import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'Home_screen.dart';
class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> with TickerProviderStateMixin{
late AnimationController animationController;

@override
void dispose() {
  // TODO: implement dispose
  super.dispose();
  animationController.dispose();
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        duration: const Duration(seconds: 3), vsync: this)..repeat();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
        home_screen(),
      ));
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
AnimatedBuilder(animation: animationController,
    child: Center(
      child: Container(
        width: 50,
        height: 50,
        child: Center(
            child: CircleAvatar(backgroundImage: AssetImage("assets/images/logo2.png",),
            radius:double.maxFinite
            )
        ),
      ),
    ),
    builder:( builder,Widget?child){
  return Transform.rotate(
      angle:animationController.value *2 *math.pi,
  child:child);
}),
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                Text("Geography",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
              ],
            ),
          )
    );
  }
}
