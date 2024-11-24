import 'dart:developer';

import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
dynamic dataMatch;
dynamic dataList;
dynamic dataTeams;
Map cricketTeams={};
Map cricketMatch={};
Future getData1()async{
  var response = await FirebaseFirestore.instance.collection("match_list").doc("F2889lT50WRVFwqEKVlC").get();
  var response1 = await FirebaseFirestore.instance.collection("cricket_match").get();
  var response2 = await FirebaseFirestore.instance.collection("cricket_teams").get();
  dataTeams=response2.docs;
  dataList=response;
  dataMatch = response1.docs;
  for(int i=0;i<dataMatch.length;i++){
    cricketMatch[dataMatch[i]["id"]]={"team1":dataMatch[i]["team1"],"team2":dataMatch[i]["team2"],"winner":dataMatch[i]["winner"]};
  }
 for(int i=0;i<dataTeams.length;i++){
    cricketTeams[dataTeams[i]["id"]]=dataTeams[i]["name"];
  }
// print(cricketTeams[cricketMatch[dataList["cricket"][0]]["team1"]]);
  // print(cricketMatch[dataList["cricket"][0]]["team1"]);
  // print(cricketTeams);
  // print(cricketMatch);


    log(dataMatch[0]["team2"]);

    log(dataMatch[0]["team1"]);
  
}

int curGroup=0;
class DetailedSchedule extends StatefulWidget {
  const DetailedSchedule({super.key});
  @override
  State createState() => _DetailedScheduleState();
}

class _DetailedScheduleState extends State {
  
  Color? teamColor(int index){
    if(index%2==0){
    if(curGroup==0){
      return cricketMatch[dataList["cricket"][index~/2]]["winner"]=="team1"?
      Colors.green:
      cricketMatch[dataList["cricket"][index~/2]]["winner"]=="team2"?
      Colors.red:
      const Color.fromARGB(255, 198, 198, 198);
    }else if(curGroup==1){
      return cricketMatch[dataList["cricket"][index~/2+(index<32?4:index>32&&index<48?2:1)]]["winner"]=="team1"?
      Colors.green:
      cricketMatch[dataList["cricket"][index~/2+(index<32?4:index>32&&index<48?2:1)]]["winner"]=="team2"?
      Colors.red:
      const Color.fromARGB(255, 198, 198, 198);
    }else if(curGroup==2){
      return cricketMatch[dataList["cricket"][index~/2+(index<32?8:index>32&&index<48?4:2)]]["winner"]=="team1"?
      Colors.green:
      cricketMatch[dataList["cricket"][index~/2+(index<32?8:index>32&&index<48?4:2)]]["winner"]=="team2"?
      Colors.red:
      const Color.fromARGB(255, 198, 198, 198);
    }else{
      return cricketMatch[dataList["cricket"][index~/2+(index<32?12:index>32&&index<48?6:3)]]["winner"]=="team1"?
      Colors.green:
      cricketMatch[dataList["cricket"][index~/2+(index<32?12:index>32&&index<48?6:3)]]["winner"]=="team2"?
      Colors.red:
      const Color.fromARGB(255, 198, 198, 198);
    }
  }else{
    if(curGroup==0){
      return cricketMatch[dataList["cricket"][index~/2]]["winner"]=="team2"?
      Colors.green:
      cricketMatch[dataList["cricket"][index~/2]]["winner"]=="team1"?
      Colors.red:
      const Color.fromARGB(255, 198, 198, 198);
    }else if(curGroup==1){
      return cricketMatch[dataList["cricket"][index~/2+(index<32?4:index>32&&index<48?2:1)]]["winner"]=="team2"?
      Colors.green:
      cricketMatch[dataList["cricket"][index~/2+(index<32?4:index>32&&index<48?2:1)]]["winner"]=="team1"?
      Colors.red:
      const Color.fromARGB(255, 198, 198, 198);
    }else if(curGroup==2){
      return cricketMatch[dataList["cricket"][index~/2+(index<32?8:index>32&&index<48?4:2)]]["winner"]=="team2"?
      Colors.green:
      cricketMatch[dataList["cricket"][index~/2+(index<32?8:index>32&&index<48?4:2)]]["winner"]=="team1"?
      Colors.red:
      const Color.fromARGB(255, 198, 198, 198);
    }else{
      return cricketMatch[dataList["cricket"][index~/2+(index<32?12:index>32&&index<48?6:3)]]["winner"]=="team2"?
      Colors.green:
      cricketMatch[dataList["cricket"][index~/2+(index<32?12:index>32&&index<48?6:3)]]["winner"]=="team1"?
      Colors.red:
      const Color.fromARGB(255, 198, 198, 198);
    }
  }
  }

  String teamName(int index){
    if(index%2==0){
      if(curGroup==0){
      return cricketMatch[dataList["cricket"][index~/2]]["team1"].length==20?cricketTeams[cricketMatch[dataList["cricket"][index~/2]]["team1"]]:cricketMatch[dataList["cricket"][index~/2]]["team1"];
    }else if(curGroup==1){
      return cricketMatch[dataList["cricket"][index~/2+(index<32?4:index>32&&index<48?2:1)]]["team1"].length==20?cricketTeams[cricketMatch[dataList["cricket"][index~/2+(index<32?4:index>32&&index<48?2:1)]]["team1"]]:cricketMatch[dataList["cricket"][index~/2+(index<32?4:index>32&&index<48?2:1)]]["team1"];
    }else if(curGroup==2){
      return cricketMatch[dataList["cricket"][index~/2+(index<32?8:index>32&&index<48?4:2)]]["team1"].length==20?cricketTeams[cricketMatch[dataList["cricket"][index~/2+(index<32?8:index>32&&index<48?4:2)]]["team1"]]:cricketMatch[dataList["cricket"][index~/2+(index<32?8:index>32&&index<48?4:2)]]["team1"];
    }else{
      return cricketMatch[dataList["cricket"][index~/2+(index<32?12:index>32&&index<48?6:3)]]["team1"].length==20?cricketTeams[cricketMatch[dataList["cricket"][index~/2+(index<32?12:index>32&&index<48?6:3)]]["team1"]]:cricketMatch[dataList["cricket"][index~/2+(index<32?12:index>32&&index<48?6:3)]]["team1"];
    }
    }else{
       if(curGroup==0){
      return cricketMatch[dataList["cricket"][index~/2]]["team2"].length==20?cricketTeams[cricketMatch[dataList["cricket"][index~/2]]["team2"]]:cricketMatch[dataList["cricket"][index~/2]]["team2"];
    }else if(curGroup==1){
      return cricketMatch[dataList["cricket"][index~/2+(index<32?4:2)]]["team2"].length==20?cricketTeams[cricketMatch[dataList["cricket"][index~/2+(index<32?4:2)]]["team2"]]:cricketMatch[dataList["cricket"][index~/2+(index<32?4:2)]]["team2"];
    }else if(curGroup==2){
      return cricketMatch[dataList["cricket"][index~/2+(index<32?8:4)]]["team2"].length==20?cricketTeams[cricketMatch[dataList["cricket"][index~/2+(index<32?8:4)]]["team2"]]:cricketMatch[dataList["cricket"][index~/2+(index<32?8:4)]]["team2"];
    }else{
      return cricketMatch[dataList["cricket"][index~/2+(index<32?12:6)]]["team2"].length==20?cricketTeams[cricketMatch[dataList["cricket"][index~/2+(index<32?12:6)]]["team2"]]:cricketMatch[dataList["cricket"][index~/2+(index<32?12:6)]]["team2"];
    }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 38, 39),
      appBar: AppBar(
        leading:Builder(
          builder: (context) {
            return GestureDetector(
                onTap:(){
                    Scaffold.of(context).openDrawer();
                },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size:30,
              ),
              );
          }
        ),
        actions:const [
          Text("Login",
          style:TextStyle(
          color: Colors.white,
          fontSize:15,
          fontWeight:FontWeight.w500
        ),
          ),
           Icon(Icons.login,
           color: Colors.white,
           ),
        ],
        title: const Text("VictoryVault",
        style:TextStyle(
          color: Colors.white,
          fontSize:30,
          fontWeight:FontWeight.w900
        ),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 57, 101),
        
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
              Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/Images/Cricket.png")),
                    const Text(
                      "Cricket",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
            
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      Container(
                        height:45,
                        width:130,
                        decoration:const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin:const EdgeInsets.symmetric(horizontal: 10),
                              height:20 ,
                              width: 20,
                              child: Image.asset("assets/Images/battle.png")),
                            const Text("Matches"),
                          ],
                          ),
                      ),
                      Container(
                        height:45,
                        width:130,
                        decoration:const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue,
                        ),
                        child: Row(
                          children: [
                            Container(margin:const EdgeInsets.symmetric(horizontal: 10),
                              
                              child: Image.asset("assets/Images/schedule.png",color: Colors.black),),
                            const Text("Shedule"),
                          ],
                          ),
                      ),
                      Container(
                        height:45,
                        width:130,
                        decoration:const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin:const EdgeInsets.symmetric(horizontal: 10),
                              height: 20,
                              width: 20,
                              child:const Icon(Icons.leaderboard)
                              // child: Image.asset("assets/sports.png"),
                              ),
                            const Text("Leaderboard"),
                          ],
                          ),
                      ),
                    ],
                  ),
                ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                     dataTeams.length <9 ? const Text("") : Container(alignment: Alignment.center,
                      // color: Colors.white,
                      margin: const EdgeInsets.only(top: 10,bottom: 10,left:10),
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              curGroup = index;
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              // margin: const EdgeInsets.symmetric(horizontal:2),
                              height: 50,
                              width:
                                  MediaQuery.of(context).size.width / 4 - 10,
                              decoration: BoxDecoration(
                                color: index == curGroup ? Colors.blue : null,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10),),
                              ),
                              child: Text(
                                index == 0
                                    ? "Group A"
                                    : index == 1
                                        ? "Group B"
                                        : index == 2
                                            ? "Group C"
                                            : "Group D",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),


                    //condition to be change  to  dataTeams.length <9 
                
                  dataTeams.length <9 ?const Text (""): Container(
                  alignment: Alignment.center,
                  height:400,
                  width: 400,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                      child:ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                                      // margin:const EdgeInsets.only(right:10,left:10,top:15),
                                      height:400,
                                      width:400,
                                      decoration:const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        // color:Colors.grey,
                                      ),
                                    
                                      child:Stack(
                                        children: [
                             Container(
                            height:400,
                                      width:400,
                                      clipBehavior: Clip.antiAlias,
                                      decoration:const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color:Color.fromARGB(255, 9, 9, 9),
                                      ),
                            child: Image.asset("assets/schedule_diagram/team8r.png", fit: BoxFit.fill,)),
                                    
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width:4),
                                Column(
                                  children: [
                                    Container(
                                      margin:const EdgeInsets.only(top:4),
                                      height: 28,
                                      width:70,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                      color:teamColor(0),
                                      ),
                                      child:Text(teamName(0)),
                                      ),
                                      Container(
                                      margin:const EdgeInsets.only(top:30),
                                      height: 28,
                                      width:70,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(1),
                                      ),
                                      child:Text(teamName(1)),                                      ),
                                      Container(
                                      margin:const EdgeInsets.only(top:15),
                                      height: 28,
                                      width:70,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(2),
                                      ),
                                      child:Text(teamName(2)),                                      ),
                                      Container(
                                      margin:const EdgeInsets.only(top:30),
                                      height: 29,
                                      width:70,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(3),
                                      ),
                                      child:Text(teamName(3)),                                       ),
                                      Container(
                                      margin:const EdgeInsets.only(top:14),
                                      height: 29,
                                      width:70,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(4),
                                      ),
                                      child:Text(teamName(4)),                                       ),
                                      Container(
                                      margin:const EdgeInsets.only(top:30),
                                      height: 28,
                                      width:70,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(5),
                                      ),
                                      child:Text(teamName(5)),                                       ),
                                      Container(
                                      margin:const EdgeInsets.only(top:16),
                                      height: 29,
                                      width:70,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(6),
                                      ),
                                      child:Text(teamName(6)),                                       ),
                                      Container(
                                      margin:const EdgeInsets.only(top:30),
                                      height: 28,
                                      width:71,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(7),
                                      ),
                                      child:Text(teamName(7)),                                       ),
                                  ],
                                ),
                                const SizedBox(width:36),
                                    
                                Column(
                                  children:[
                                    
                                     Container(
                                      margin:const EdgeInsets.only(top:33),
                                      height: 28,
                                      width:71,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(32),
                                      ),
                                      child:Text(teamName(32)), 
                                      ),
                                      Container(
                                      margin:const EdgeInsets.only(top:73),
                                      height: 29,
                                      width:72,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(33),
                                      ),
                                      child:Text(teamName(33)), 
                                      ),
                                      Container(
                                      margin:const EdgeInsets.only(top:72),
                                      height: 28,
                                      width:72,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(34),
                                      ),
                                      child:Text(teamName(34)), 
                                      ),
                                      Container(
                                      margin:const EdgeInsets.only(top:75),
                                      height: 28,
                                      width:71,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(35),
                                      ),
                                      child:Text(teamName(35)), 
                                      ),
                                      ],
                                ),
                                const SizedBox(width: 38,),
                                    
                                Column(
                                  children: [
                                    Container(
                                      margin:const EdgeInsets.only(top:91),
                                      height: 28,
                                      width:70,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(48),
                                      ),
                                     child:Text(teamName(48)),                                       ),
                                      Container(
                                      margin:const EdgeInsets.only(top:176),
                                      height: 28,
                                      width:70,
                                      alignment: Alignment.center,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:teamColor(49),
                                      ),
                                     child:Text(teamName(49)),                                       ),
                                  ],
                                ),
                                const SizedBox(width:37),
                                    
                                Container(
                                      margin:const EdgeInsets.only(top:193),
                                      height: 28,
                                      width:71,
                                      decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:curGroup==0?
                                         cricketMatch[dataList["cricket"][28]]["winner"]=="team1"?Colors.green:
                                         cricketMatch[dataList["cricket"][28]]["winner"]=="team2"?Colors.red:const Color.fromARGB(255, 198, 198, 198):
                                         curGroup==1?
                                         cricketMatch[dataList["cricket"][28]]["winner"]=="team2"?Colors.green:
                                         cricketMatch[dataList["cricket"][28]]["winner"]=="team1"?Colors.red:const Color.fromARGB(255, 198, 198, 198):
                                         curGroup==2?
                                         cricketMatch[dataList["cricket"][29]]["winner"]=="team1"?Colors.green:
                                         cricketMatch[dataList["cricket"][29]]["winner"]=="team2"?Colors.red:const Color.fromARGB(255, 198, 198, 198):
                                         cricketMatch[dataList["cricket"][29]]["winner"]=="team2"?Colors.green:
                                         cricketMatch[dataList["cricket"][29]]["winner"]=="team1"?Colors.red:const Color.fromARGB(255, 198, 198, 198),
                                      ),
                                      alignment: Alignment.center,
                                      child:Text(curGroup==0?
                                        cricketMatch[dataList["cricket"][28]]["team1"].length==20?cricketTeams[cricketMatch[dataList["cricket"][28]]["team1"]]:cricketMatch[dataList["cricket"][28]]["team1"]:
                                        curGroup==1?
                                        cricketMatch[dataList["cricket"][28]]["team2"].length==20?cricketTeams[cricketMatch[dataList["cricket"][28]]["team2"]]:cricketMatch[dataList["cricket"][28]]["team2"]:
                                        curGroup==2?
                                        cricketMatch[dataList["cricket"][29]]["team1"].length==20?cricketTeams[cricketMatch[dataList["cricket"][29]]["team1"]]:cricketMatch[dataList["cricket"][29]]["team1"]:
                                        cricketMatch[dataList["cricket"][29]]["team2"].length==20?cricketTeams[cricketMatch[dataList["cricket"][29]]["team2"]]:cricketMatch[dataList["cricket"][29]]["team2"]
                                        ),
                                      ),
                                    
                              ],
                            ),
                                        ],
                                      ),
                                    ),
                        ],
                      ),
                ),
                  ],
                ),
            
                const SizedBox(height: 10,),

                   //condition to be change  to  dataTeams.length <9 
            
                 dataTeams.length <9? const Text(""): Container(
                    alignment: Alignment.center,
                    height:430,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                  
                        child:ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin:const EdgeInsets.only(right:10,left:10,top:15),
                height:400,
                width:400,
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  // color:Colors.grey,
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
                      child: Image.asset("assets/schedule_diagram/team4r.png", fit: BoxFit.fill,)),
            
                      Row(
                        children: [
                          const SizedBox(width:38),
                          Column(
                            children: [
                              Container(
                                margin:const EdgeInsets.only(top:48),
                                height: 40,
                                width:79,
                                alignment: Alignment.center,
                                decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:cricketMatch[dataList["cricket"][28]]["winner"]=="team1"?Colors.green:
                                         cricketMatch[dataList["cricket"][28]]["winner"]=="team2"?Colors.red:const Color.fromARGB(255, 198, 198, 198),
                                      ),
                                child:Text(cricketMatch[dataList["cricket"][28]]["team1"].length==20?cricketTeams[cricketMatch[dataList["cricket"][28]]["team1"]]:cricketMatch[dataList["cricket"][28]]["team1"]),
                                ),
                                Container(
                                margin:const EdgeInsets.only(top:42),
                                height: 40,
                                width:79,
                                alignment: Alignment.center,
                                decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:cricketMatch[dataList["cricket"][28]]["winner"]=="team2"?Colors.green:
                                         cricketMatch[dataList["cricket"][28]]["winner"]=="team1"?Colors.red:const Color.fromARGB(255, 198, 198, 198),                                      ),
                                child:Text(cricketMatch[dataList["cricket"][28]]["team2"].length==20?cricketTeams[cricketMatch[dataList["cricket"][28]]["team2"]]:cricketMatch[dataList["cricket"][28]]["team2"]),
                                ),
                                Container(
                                margin:const EdgeInsets.only(top:20),
                                height: 40,
                                width:79,
                                alignment: Alignment.center,
                                decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:cricketMatch[dataList["cricket"][29]]["winner"]=="team1"?Colors.green:
                                         cricketMatch[dataList["cricket"][29]]["winner"]=="team2"?Colors.red:const Color.fromARGB(255, 198, 198, 198),                                      ),
                                child:Text(cricketMatch[dataList["cricket"][29]]["team1"].length==20?cricketTeams[cricketMatch[dataList["cricket"][29]]["team1"]]:cricketMatch[dataList["cricket"][29]]["team1"]),
                                ),
                                Container(
                                margin:const EdgeInsets.only(top:42),
                                height: 40,
                                width:79,
                                alignment: Alignment.center,
                                decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:cricketMatch[dataList["cricket"][29]]["winner"]=="team2"?Colors.green:
                                         cricketMatch[dataList["cricket"][29]]["winner"]=="team1"?Colors.red:const Color.fromARGB(255, 198, 198, 198),                                      ),
                                child:Text(cricketMatch[dataList["cricket"][29]]["team2"].length==20?cricketTeams[cricketMatch[dataList["cricket"][29]]["team2"]]:cricketMatch[dataList["cricket"][29]]["team2"]),
                                ),                          
                            ],
                          ),
                          const SizedBox(width:42),
            
                          Column(
                            children:[
                              
                               Container(
                                margin:const EdgeInsets.only(top:88),
                                height: 41,
                                width:79,
                                alignment: Alignment.center,
                                decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:cricketMatch[dataList["cricket"][30]]["winner"]=="team1"?Colors.green:
                                         cricketMatch[dataList["cricket"][30]]["winner"]=="team2"?Colors.red:const Color.fromARGB(255, 198, 198, 198),                                      ),
                                child:Text(cricketMatch[dataList["cricket"][30]]["team1"].length==20?cricketTeams[cricketMatch[dataList["cricket"][30]]["team1"]]:cricketMatch[dataList["cricket"][30]]["team1"]),
                                ),
                                Container(
                                margin:const EdgeInsets.only(top:102),
                                height: 41,
                                width:79,
                                alignment: Alignment.center,
                                decoration:BoxDecoration(
                                        borderRadius:const BorderRadius.all(Radius.circular(4)),
                                        color:cricketMatch[dataList["cricket"][30]]["winner"]=="team2"?Colors.green:
                                         cricketMatch[dataList["cricket"][30]]["winner"]=="team1"?Colors.red:const Color.fromARGB(255, 198, 198, 198),                                      ),
                                child:Text(cricketMatch[dataList["cricket"][30]]["team2"].length==20?cricketTeams[cricketMatch[dataList["cricket"][30]]["team2"]]:cricketMatch[dataList["cricket"][30]]["team2"]),
                                ),
                                ],
                          ),
            
                        ],
                      ),
                      
                          Container(
                            margin:const EdgeInsets.only(top:171,left:280),
                            height: 41,
                                width:80,
                                alignment: Alignment.center,
                                decoration:const BoxDecoration(
                                        borderRadius:BorderRadius.all(Radius.circular(4)),
                                        // color:Colors.red,
                                      ),
                            child:const Text("Winner"),
                            ),
                  ],
                ),
              ),
                          ],
                        ),
                ),
            
                Padding(
                  padding:dataTeams.length <9? const EdgeInsets.only(left:20,bottom:5):const EdgeInsets.only(top:40,left:20,bottom:5),
                  child:const Text("Matches",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                ),
            
                ListView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount:dataList["cricket"].length ,
                  itemBuilder: (context ,index){
                    return 
                    Container(
                      margin:const EdgeInsets.symmetric(vertical:7.5,horizontal:5),
                      padding:const EdgeInsets.only(left:10,top:5,bottom:10),
                      width:MediaQuery.of(context).size.width,
                      // height:80,
                      decoration:const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10),
                  ),
                  color: Colors.white, 
                ), 
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       children:[ 
                        Text("Match : ${index+1}",
                        style:const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Container(
                            alignment: Alignment.bottomRight,
                            width:100,
                            child:Text(
                              cricketMatch[dataList["cricket"][index]]["team1"].length==20?cricketTeams[cricketMatch[dataList["cricket"][index]]["team1"]]:cricketMatch[dataList["cricket"][index]]["team1"],
                              style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                            ),
                            ),
                          const Text("  vs  ",
                          style:TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            width:100,
                            child:Text(
                              cricketMatch[dataList["cricket"][index]]["team2"].length==20?cricketTeams[cricketMatch[dataList["cricket"][index]]["team2"]]:cricketMatch[dataList["cricket"][index]]["team2"],
                            style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                            ),
                            ),
                        ],),
                            
                        Center(
                          child:Text(cricketMatch[dataList["cricket"][index]]["winner"]!="null"?"completed : team ${cricketTeams[cricketMatch[dataList["cricket"][index]][cricketMatch[dataList["cricket"][index]]["winner"]]]} won the match":cricketMatch[dataList["cricket"][index]]["time"]=="null"?"match starts at ${cricketMatch[dataList["cricket"][index]]["time"]}":"upcoming",
                          style:const TextStyle(
                            color: Color.fromARGB(255, 248, 137, 1),
                          )
                          ))
                        ]
                      ),
                      );
                  },
                  ),
              ],
            ),
          ),
        ],
      ),

      drawer: Drawer(
        // width:280,
        child:ListView(
          children: [
      const SizedBox(height:50),
      ListTile(
        title: const Text('Item 1'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      const Divider(),
      ListTile(
        title: const Text('Item 2'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
       const Divider(),
       ListTile(
        title: const Text('Item 2'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      const Divider(),
          ],
        ),
      ),
    );
  }
}
