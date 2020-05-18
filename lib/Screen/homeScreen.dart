import 'dart:convert';

import 'package:covidtracker/Widgets/info_widget.dart';
import 'package:covidtracker/Widgets/most_affected_countries.dart';
import 'package:covidtracker/Widgets/worldwide_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DataSource/datasource.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map worldData;
  fetchWorldWideData() async {
    http.Response response=await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      worldData=json.decode(response.body);
    });


  }

  List countryData;
  fetchCountryData() async {
    http.Response response=await http.get("https://corona.lmao.ninja/v2/countries?sort=cases");
   setState(() {
     countryData=json.decode(response.body);
   });


  }

  @override
  void initState() {
    // TODO: implement initState
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.orange[100],
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text("\"${DataSource.quote}\"",style: TextStyle(
                fontSize: 16,
                color:Colors.orange[900],
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Worldwide',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22
                ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  color: Colors.black,
                  child: Text('Regional',style: TextStyle(
                    color: Colors.white
                  ),),
                  onPressed: (){
                      Navigator.of(context).pushNamed("/country-page");
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          worldData==null?CircularProgressIndicator(): WorldwidePanel(worldData),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left:10),
            child: Text(

              "Most Affected Countries",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),
          ),
        countryData==null?CircularProgressIndicator():MostAffected(countryData),
        InfoPanel(),
          SizedBox(
            height: 20,
            child: Text(
                'We are together in this fight ',
                style: TextStyle(color: Colors.black,fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          SizedBox(height: 50,),

        ],
      ),
    );
  }
}
