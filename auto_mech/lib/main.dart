import "package:auto_mech/otp_screen.dart";
import "package:flutter/material.dart";
import "./login_page.dart";
import "./otp_screen.dart";
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home:OtpScreen(),
    );
  }
}