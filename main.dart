import 'package:flutter/material.dart';
import 'package:science_lab_2/event_provider.dart';
import 'package:science_lab_2/pages/home.dart';
import 'package:science_lab_2/pages/equipment.dart';
import 'package:science_lab_2/pages/publications.dart';
import 'package:science_lab_2/pages/publish.dart';
import 'package:science_lab_2/pages/planning.dart';
import 'package:science_lab_2/pages/projects.dart';
import 'package:science_lab_2/pages/menu.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/equipment': (context) => Equipment(),
          '/publications': (context) => Publications(),
          '/publish': (context) => Publish(),
          '/planning': (context) => Planning(),
          '/projects': (context) => Projects(),
          '/menu': (context) => Menu(),
        },
      ));
}