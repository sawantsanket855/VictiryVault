 import "package:flutter/material.dart";
//  import "./schedule.dart";
import "./schedule_diagram.dart";
//  import "./groups.dart";
 void main(){
  runApp(const MyApp());
 }

 class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home:ScheduleDiagramApp(),
    );
  }
 }