import 'package:flutter/material.dart';
import "package:world_time/Services/world_time.dart";

class ChoosingPlaces extends StatefulWidget {
  @override
  _ChoosingPlacesState createState() => _ChoosingPlacesState();
}

class _ChoosingPlacesState extends State<ChoosingPlaces> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),

  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //Navigate back by popping the  screen and passing the data
    Navigator.pop(context,{
      "location" : instance.location ,
      "time" : instance.time ,
      "flag" : instance.flag,
      "isDayTime" : instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    //print("build func ran");

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a Location",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent[400],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
            child: Card(
              child: ListTile(
                onTap:(){
                  //print(locations[index].location);
                  updateTime(index);
                },
                title: Text("${locations[index].location}"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
