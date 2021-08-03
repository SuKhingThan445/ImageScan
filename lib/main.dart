import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vision/image_scanner/image_detail.dart';
import 'package:flutter_vision/splash_screen/splash_screen.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'database.dart';
import 'image_scanner/camera_screen.dart';
import 'models/person.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print(e);
  }
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final personDao = database.personDao;

  final person = Person(1, 'Frank');
  await personDao.insertPerson(person);

  final result = await personDao.findAllPersons();
  debugPrint("PersonSelect ${result.length.toString()}");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ML Vision',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(cameras),
    );
  }
}




//
// import 'package:flutter/material.dart';
// import 'home/home_screen.dart';
//
// List<CameraDescription> cameras = [];
// Future<void> main() async {
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     print(e);
//   }
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Clean Code',
//         home: SplashScreen()
//     );
//   }
// }
//
