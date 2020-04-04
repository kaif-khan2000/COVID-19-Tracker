import 'package:covvid19_tracker_2/about.dart';
import 'package:covvid19_tracker_2/state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covvid19_tracker_2/state_tile.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'dart:async';
void main() {
  runApp(MaterialApp(
    home: CoronaTracker(),
    debugShowCheckedModeBanner: false,
  ));
}

class CoronaTracker extends StatefulWidget {
  @override
  _CoronaTrackerState createState() => _CoronaTrackerState();
}

class _CoronaTrackerState extends State<CoronaTracker> {
  
  final String url = "https://api.covid19india.org/data.json"; 
  Future<States> state;
  //returning states data 
  Future<List<States>> fetchData() async {
    final response = await http.get(url);
    if(response.statusCode == 200){
      //everything went well 
      //return the states object
      var jsonData = json.decode(response.body);
      List<States> states = [];
      for(var u in jsonData['statewise']){
        States state = States(active: u['active'],confirmed: u['confirmed'],deaths: u['deaths'],recovered: u['recovered'],lastUpdated: u['lastupdatedtime'],state: u['state']);
        states.add(state);
      }
      //print(states[1].state);
      return states;
      //States.fromJson(json.decode(response.body));
    }else{
      throw Exception('json not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    //fetchData();
    //print(state);
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text('Covid-19 Tracker'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            color: Colors.blueGrey[700],
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => About(),
              ));
            }, 
            icon: Icon(Icons.person), 
            label: Text("About"),
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
          
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => StateTile(state: snapshot.data[index],),
              
            );
          }else{
            return Container(
              color: Colors.blueGrey[700],
                child: Center(
                  child: SpinKitChasingDots(
                    color: Colors.white,
                    size: 50.0,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}