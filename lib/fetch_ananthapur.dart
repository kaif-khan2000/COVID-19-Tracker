import 'package:covvid19_tracker_2/state.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class FetchAnathapur{

  String url = "https://api.covid19india.org/state_district_wise.json";
  Future<String> fetchDataAnanthapur() async {
    final response = await http.get(url);
    if(response.statusCode == 200){
      //everything went well 
      //return the states object
      var jsonData = json.decode(response.body);
      States state;
      /*for(var u in jsonData['Andhra Pradesh']){
        States state = States(active: u['active'],confirmed: u['confirmed'],deaths: u['deaths'],recovered: u['recovered'],lastUpdated: u['lastupdatedtime'],state: u['state']);
        states.add(state);
      }*/
      var u = jsonData['Andhra Pradesh']['districtData']['Anantapur'];
      state = States(confirmed: u['confirmed'].toString());
      print(state.confirmed);
      //print(states[1].state);
      String confirmed = state.confirmed;
      return confirmed;
      //States.fromJson(json.decode(response.body));
    }else{
      throw Exception('json not found');
    }
  }
}