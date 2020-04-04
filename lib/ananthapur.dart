import 'package:covvid19_tracker_2/fetch_ananthapur.dart';
import 'package:covvid19_tracker_2/state.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Anathapur extends StatefulWidget {
   States state;
   Anathapur({this.state});
  @override
  _AnathapurState createState() => _AnathapurState();
}

class _AnathapurState extends State<Anathapur> {
  Future<String> ananthapurCases;
  @override
  
  @override
  Widget build(BuildContext context) {
    States state = widget.state;
    return FutureBuilder(
      future: FetchAnathapur().fetchDataAnanthapur(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Active:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      state.active,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red[700],
                      ),
                    ),
                  ],
                ),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Confirmed:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      state.confirmed,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red[700],
                      ),
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Deaths:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      state.deaths,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red[700],
                      ),
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Recovered:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      state.recovered,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red[700],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Ananthapur Confirmed:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      snapshot.data,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[700],
                      ),
                    ),
                  ],
                ),

                
              ],
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
    );
  }
}