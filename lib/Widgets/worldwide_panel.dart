import 'package:flutter/material.dart';
class WorldwidePanel extends StatelessWidget {

  final Map worldData;

  WorldwidePanel(this.worldData);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics:  NeverScrollableScrollPhysics(),
      children: [
        StatusPanel(Colors.redAccent,"CONFIRMED",worldData["cases"].toString()),
        StatusPanel(Colors.blueAccent,"ACTIVE",worldData["active"].toString()),
        StatusPanel(Colors.green,"RECOVERED",worldData["recovered"].toString()),
        StatusPanel(Colors.grey,"DEATHS",worldData["deaths"].toString()),
      ],
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,


      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color color;
  final String title;
  final String count;
  StatusPanel(this.color,this.title,this.count);
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(8),
      height: 80,
      width: width/2,
      color: color.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(
              fontSize: 18,
              color: color
                  ,fontWeight: FontWeight.bold
            ),),
            Text(count,style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),

    );

  }
}
