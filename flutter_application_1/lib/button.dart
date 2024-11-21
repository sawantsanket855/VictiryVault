import "package:flutter/material.dart";
import "./scoring.dart";



class Button extends StatefulWidget {
  const Button({super.key});
  @override
  State createState()=>_Button();
}  
class _Button extends State{
  void navigate()async{
  Navigator.push(context,MaterialPageRoute(builder: (context){return const ScoreApp();}) );
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: ElevatedButton(
          onPressed: ()async{
               await getData();
               navigate();
        }, child: const Text("start"),),
      ),
    );
  }
}
