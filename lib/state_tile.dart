import 'package:covvid19_tracker_2/state.dart';
import 'package:covvid19_tracker_2/state_page.dart';
import 'package:flutter/material.dart';


class StateTile extends StatelessWidget {
  States state;
  StateTile({this.state,});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (context) => StatePage(state:state),
        ));
      },
      child: Padding(
        padding: EdgeInsets.only(top:8.0),
        child: Container(
          padding: EdgeInsets.only(top:10),
          height: 90,
          child: Card(
            color: Colors.blueGrey[800],
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(state.confirmed,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                
                ),
                radius: 25,
                backgroundColor: Colors.blueGrey[900],
              ),
              title:  Text(state.state,
                  
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontSize: 20,
                  ),
                ),
              subtitle: Text("updated ${state.lastUpdated} ",style: TextStyle(color: Colors.white,fontSize: 10),),
            ),
          ),
        ),
      ),
    );
  }
}