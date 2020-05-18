import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'search.dart';
class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetCountryData() async{
    http.Response response =await http.get("https://corona.lmao.ninja/v2/countries?sort=cases");
    setState(() {
    countryData=json.decode(response.body);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Country stats'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
            showSearch(context: context, delegate: Search(countryData));
            },
          )
        ],
      ),
      body: countryData==null?Center(child: CircularProgressIndicator(),):ListView.builder(itemBuilder: (context,index){
      return Container(
        height: 130,
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
        color: Colors.white,boxShadow:[
          BoxShadow(color: Colors.grey[100],
          blurRadius: 10,offset: Offset(0,10))
        ],
        ),
        child: Row(
        children: [
         Container(
           margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(countryData[index]["country"],style: TextStyle(fontWeight: FontWeight.bold),),
            Image.network(countryData[index]["countryInfo"]["flag"],height: 50,width: 60,),

          ],
          ),
         ),
          Expanded(
        child: Container(
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('CONFIRMED : '+countryData[index]['cases'].toString(),style: TextStyle(fontWeight:
            FontWeight.bold,color: Colors.red),),
            Text('ACTIVE : '+countryData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold
            ,color: Colors.blue),),
            Text('RECOVERED : '+countryData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold
        ,color: Colors.green)),
            Text('DEATHS : '+countryData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold
            ,color: Colors.red)),
          ],
          ),
        ),
          )

        ],
        ),
      );
      },itemCount: countryData==null?0:countryData.length,),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetCountryData();

  }
}
