// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =       data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    // ignore: avoid_print
    print(data);
    String bgimage = data['daytime'] ? 'day.png' : 'night.png';
    print(bgimage);

    return Scaffold(
      // ignore: duplicate_ignore, duplicate_ignore
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/$bgimage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton.icon(
            label: Text('Edit Location',
            style: TextStyle(
              color: Colors.white,

            ),
            ),
            onPressed: () async {
              dynamic result = await Navigator.pushNamed(context, '/location');
              setState(() {
                data = {
                  'time': result['time'],
                  'location': result['location'],
                  'flag': result['flag'],
                  'daytime': result['daytime'],
                };
              });
            },
            icon: Icon(Icons.edit_location),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 30,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                data['location'],
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),

          Text(data['time'],
              style: TextStyle(
                fontSize: 66,
                color: Colors.white,
              ))
        ]),
      ),
    );
  }
}

class ModalRoutes {}
