import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        GestureDetector(
          onTap: (){
              Navigator.of(context).pushNamed("/faqs");
                  
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10,right: 10,top: 5),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('FAQS',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate');
          },
          child: Container(
            padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 10,right: 10,top: 10),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('DONATE',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
          },
          child: Container(

            padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 10,right: 10,top: 10),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('MYTH-BUSTERS',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
