import "package:flutter/material.dart";

class ScheduleDiagram1App extends StatefulWidget {
  const ScheduleDiagram1App({super.key});
  @override
  State createState()=>_ScheduleDiagram1State();
}

class _ScheduleDiagram1State extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading:const Icon(Icons.keyboard_arrow_left_rounded,size: 30,),
        title: const Text("Cricket",
          style:TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:Center(
        child:Container(
          height:400,
          width:400,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color:Colors.grey,
          ),

          child:Stack(
            children: [
              Container(
                height:400,
          width:400,
          clipBehavior: Clip.antiAlias,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color:Colors.grey,
          ),
                child: Image.asset("assets/schedule_diagram/team4.png", fit: BoxFit.fill,)),

                Row(
                  children: [
                    const SizedBox(width:49),
                    Column(
                      children: [
                        Container(
                          margin:const EdgeInsets.only(top:75),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team1"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:41),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team2"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:21),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team3"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:42),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team4"),
                          ),                          
                      ],
                    ),
                    const SizedBox(width:43),

                    Column(
                      children:[
                        
                         Container(
                          margin:const EdgeInsets.only(top:113),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Winnner1",
                          ),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:98),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Winner2"),
                          ),
                          ],
                    ),
                    const SizedBox(width: 43,),

                    Container(
                      margin:const EdgeInsets.only(top:13),
                      height: 35,
                      width:77,
                      alignment: Alignment.center,
                      child:const Text("Winner3"),
                      ),

                  ],
                ),
            ],
          ),
        ),
      ),



    );

  }
}


