import 'package:flutter/material.dart';
import './Screen/homeScreen.dart';
import './Screen/country_page.dart';
import 'Screen/faq_screen.dart';
void main(){
  runApp(MaterialApp(
    home: HomePage(),
    routes: {
    '/faqs':(ctx)=>FaqScreen(),
      '/country-page':(ctx)=>CountryPage(),
    },
    theme: ThemeData(
      primaryColor: Color(0xff202c3b),
      fontFamily: 'Circular'
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(

      title: Text('COVID-19 TRACKER APP'),
    ),
    body:HomeScreen(), );
  }
}







