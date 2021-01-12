import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    //captures the data from the loading screen
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //print(data);
    //print(data["time"]);

    //Select bgImage
    int bgIndex = data["isDayTime"];
    String bgImage;

    if(bgIndex==0){
      bgImage="Dawn.jpg";
    }
    else if(bgIndex==1){
      bgImage="Day.jpg";
    }
    else if(bgIndex==2){
      bgImage="Dusk.jpg";
    }
    else{
      bgImage="Night.jpg";
    }

      return Scaffold(
      appBar: AppBar(
        title: Text(
          "World Clock",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent[400],
      ),
      //backgroundColor: Colors.amberAccent,
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$bgImage"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data["location"],
                  style:TextStyle(
                    fontSize: 33.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent[400],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              data["time"],
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 66.0,
                letterSpacing: 1.0,
                color: Colors.amberAccent[400],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: FlatButton.icon(
                onPressed: () async{
                  dynamic result =await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      "time": result["time"],
                      "flag": result["flag"],
                      "location": result["location"],
                      "isDayTime": result["isDayTime"],
                    };
                    print(data);
                  });
                },
                label: Text("Change Location"),
                icon: Icon(Icons.edit_location_outlined),
                color: Colors.amberAccent[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
