import 'package:flutter/material.dart';
import 'package:covidtracker/DataSource/datasource.dart';
import 'package:covidtracker/Widgets/list_item.dart';

class FaqScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List list=DataSource.questionAnswers;
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQS'),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Container(
          child: ExpansionTile(
            title: Text(list[index]["question"],style: TextStyle(
              color: Colors.black,
              fontSize: 18,fontWeight: FontWeight.bold
            ),),
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  list[index]["answer"],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        );
      },itemCount: list.length,),
    );
  }
}
