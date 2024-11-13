 import "package:flutter/material.dart";
import "package:flutter_application_1/detailed_schedule.dart";
//  import "./schedule.dart";
import "./schedule_diagram.dart";
import "./detailed_schedule.dart";
//  import "./groups.dart";
 void main(){
  runApp(const MyApp());
 }

 class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home:DetailedSchedule(),
    );
  }
 }