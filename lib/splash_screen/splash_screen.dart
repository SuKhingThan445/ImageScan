import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vision/home/bottom_nav_bar.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  List<CameraDescription> cameras=[];
   SplashScreen(this.cameras);

  @override
  _SplashScreenState createState() => _SplashScreenState(cameras);
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  List<CameraDescription> cameras=[];
  _SplashScreenState(this.cameras);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Lottie.asset(
        'assets/splash_lottie.json',
        controller: _controller,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBar(cameras)),
            ));
        },
      ),
    );
  }
}


