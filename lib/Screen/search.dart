import 'package:flutter/material.dart';

class Search extends SearchDelegate{

  final List countryList;
  Search(this.countryList);
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(
      icon: Icon(Icons.clear),onPressed: (){
        query='';
    },
    )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionLsit=query.isEmpty?countryList:countryList.where((element) => element['country'].toString().
    toLowerCase().startsWith(query)).toList();

    return ListView.builder(itemBuilder: (context,index){
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
                  Text(suggestionLsit[index]["country"],style: TextStyle(fontWeight: FontWeight.bold),),
                  Image.network(suggestionLsit[index]["countryInfo"]["flag"],height: 50,width: 60,),

                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('CONFIRMED : '+suggestionLsit[index]['cases'].toString(),style: TextStyle(fontWeight:
                    FontWeight.bold,color: Colors.red),),
                    Text('ACTIVE : '+suggestionLsit[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold
                        ,color: Colors.blue),),
                    Text('RECOVERED : '+suggestionLsit[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold
                        ,color: Colors.green)),
                    Text('DEATHS : '+suggestionLsit[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold
                        ,color: Colors.red)),
                  ],
                ),
              ),
            )

          ],
        ),
      );
    },itemCount: suggestionLsit.length,);

  }
  
  
}
