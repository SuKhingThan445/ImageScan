import 'dart:math';

import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vision/image_scanner/camera_screen.dart';
import 'package:flutter_vision/models/grid_list_item.dart';

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
  List<GridListItems> items = [
    GridListItems('Bicycle', Icons.add_to_drive),
    GridListItems('Boat',  Icons.directions_boat),
    GridListItems('Bus', Icons.directions_bus),
    GridListItems('Train',  Icons.directions_railway),
    GridListItems('Walk', Icons.directions_walk),
    GridListItems('Contact',  Icons.contact_mail),
    GridListItems('Bicycle',  Icons.directions_bike),

  ];

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
        body: GridView.builder(
          itemCount:items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).orientation ==
                Orientation.landscape ? 3: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: (2 / 1),
          ),
          itemBuilder: (context,index,) {
            return GestureDetector(
              onTap:(){
               // Navigator.of(context).pushNamed(RouteName.GridViewCustom);
              },
              child:Container(
                color: RandomColorModel().getColor(),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.camera_alt),
                     Text("items[index].title",style: TextStyle(fontSize: 18, color: Colors.black),
                         textAlign: TextAlign.center),
                  ],
                ),
              ),
            );
          },
        )


        );

  }
}
class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}
