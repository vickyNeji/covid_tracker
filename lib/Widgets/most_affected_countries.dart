import 'package:http/http.dart';
import 'package:flutter/material.dart';

class MostAffected extends StatelessWidget {
  final List countryData;
  MostAffected(this.countryData);
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true
        ,itemBuilder: (context,index){
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
            Image.network(countryData[index]["countryInfo"]["flag"],width: 40,height: 35,),
              SizedBox(width: 10,),
              Text(countryData[index]["country"],style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
            Text('Deaths:${countryData[index]["deaths"]}',style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.red[900],fontSize: 13),)
            ],
          ),
        );
      },itemCount: 5,),
    );
  }
}
