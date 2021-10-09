// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myfirst/worldtime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String finaltime = "Loading Screen";

  // ignore: non_constant_identifier_names
  void SetupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Karachi', flag: 'pakistan.png', url: 'Asia/Karachi');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'daytime': instance.isday,
    });

  }

  @override
  void initState() {
    super.initState();
    SetupWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitCubeGrid(
        color: Colors.white,
        size: 15,
      )),
    );
  }
}
