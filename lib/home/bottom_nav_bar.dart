import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vision/image_scanner/camera_screen.dart';

import 'home_screen.dart';
class BottomNavBar extends StatefulWidget {
  List<CameraDescription> cameras=[];
  BottomNavBar(this.cameras);
  @override
  _BottomNavBarState createState() => _BottomNavBarState(cameras);
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<CameraDescription> cameras=[];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  _BottomNavBarState(this.cameras);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.camera_alt, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.yellow,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
              if(_page==1){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(cameras)));
              }
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.yellow,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_page.toString(), textScaleFactor: 10.0),
                ElevatedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    // final CurvedNavigationBarState navBarState =
                    //     _bottomNavigationKey.currentState;
                    // navBarState.setState(() {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(cameras)));
                    // });
                    // navBarState?.setPage(1);


                  },
                )
              ],
            ),
          ),
        ));

  }
}