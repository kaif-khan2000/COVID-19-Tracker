import 'package:covvid19_tracker_2/ananthapur.dart';
import 'package:covvid19_tracker_2/state.dart';
import 'package:flutter/material.dart';


class StatePage extends StatefulWidget {
   States state;
   StatePage({this.state});
  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  
  @override
  Widget build(BuildContext context) {
    States state = widget.state;
    bool ap = false;
    if(state.state == 'Andhra Pradesh'){
      setState(() {
        ap = true;
        
      });
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          state.state,
          style: TextStyle(color:Colors.white),
        ),
        centerTitle: true,
      ),
      
      
      body: ap ? Anathapur(state:state) : Column(
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

        ],
      ),
    );
  }
}