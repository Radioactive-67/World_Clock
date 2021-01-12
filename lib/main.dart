import 'package:flutter/material.dart';
import "package:world_time/pages/home.dart";
import "package:world_time/pages/loading.dart";
import "package:world_time/pages/choosing_places.dart";


void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":(context) => Loading(),
      "/home" : (context) => Home(),
      "/location" : (context) => ChoosingPlaces(),
    },
  ));
}



