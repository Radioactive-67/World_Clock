import "package:http/http.dart";
import "dart:convert";
import "package:intl/intl.dart";

class WorldTime{
  String location; //Location for UI
  String url; //location in the url
  String flag; //url to flag asset
  String time;//the time in that location
  int isDayTime;

  WorldTime({this.flag, this.location, this.url});

  Future<void> getTime() async{

    try {
      //make the request
      Response res = await get("https://worldtimeapi.org/api/timezone/$url");

      //store json data in a map
      Map data = jsonDecode(res.body);

      //extract the required properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      String hrs = offset.substring(1, 3);
      String mins = offset.substring(4, 6);
      print(datetime);
      print(offset);
      print(hrs);
      print(mins);

      //create a DateTime object and add the offset
      DateTime now = DateTime.parse(datetime);
      print("before $now");
      if (offset.substring(0, 1) == "+"){
        now = now.add(Duration(hours: int.parse(hrs), minutes: int.parse(mins)));
    }
      else{
        now = now.subtract(Duration(hours: int.parse(hrs), minutes: int.parse(mins)));
      }
      print("after $now");

      //set the time property
      if(now.hour>=4 && now.hour<7){
        isDayTime=0;//dawn
      }
      else if(now.hour>=7 && now.hour<18){
        isDayTime=1;//day
      }
      else if(now.hour>=18 && now.hour<20){
        isDayTime=2;//dusk
      }
      else{
        isDayTime = 3;//night
      }
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print("Error - $e");
      time = "Can't fetch the data at the moment";
    }



  }


}