import 'package:flutter/material.dart';
import "package:world_time/Services/world_time.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "loading";

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: "Kolkata", flag: "India", url: "Asia/Kolkata");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location" : instance.location ,
      "time" : instance.time ,
      "flag" : instance.flag,
      "isDayTime" : instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    //print("initState func ran");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[400],
      body: Center(
        child: SpinKitPouringHourglass(
          color: Colors.black,
          size: 100.0,
        )
      ),
    );
  }
}
