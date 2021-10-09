import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  String flag;
  String time = "";
  bool isday = false;
  WorldTime({required this.location, required this.url, required this.flag});

  Future<void> getTime() async {
    //make the request
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'].toString();
    DateTime dateTime = DateTime.parse(datetime);
    String offset = data['utc_offset'].substring(1, 3);
    dateTime = dateTime.add(Duration(hours: int.parse(offset)));
    isday = dateTime.hour > 5 && dateTime.hour < 19 ? true : false;
    print(dateTime.hour);
    time = DateFormat.jm().format(dateTime);
  }
}
