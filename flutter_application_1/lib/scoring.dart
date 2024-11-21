import 'dart:developer';

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import './data.dart';
String matchID="6HpA76ZNgBD4Yqv1PrTD";
Map data={};
Map playerName={};

 String batsman1="";
  String batsman2="";
  String bowler1="";
  int strike = 1;
  int score=0;
  int wicket=0;
  int ball=0;
  int ballNumber=0;
  int wType = -1;
  int wBatsman = -1;
  int wFielder=-1;
  int selectedRun = -1;
  bool checkWicket = false;
  bool checkWide = false;
  bool checkNoBall = false;
  bool checkByes = false;
  bool checkLegByes = false;
  List playing1=[];
  List playing2=[];
  Map inning={};
  Map batsmans={};
  Map bowlers={};

Future getData()async{
  // var response=await FirebaseFirestore.instance.collection("cricket_match").doc("matchID").get();
  var response = await FirebaseFirestore.instance.collection("cricket_match").doc(matchID).get();
  var response1=await FirebaseFirestore.instance.collection("Student").get();
  var res=response1.docs;
  playing1=response["playing1"];
  playing2=response["playing2"];
  // print(playing1);
  // print(playing2);
  for(int i=0;i<res.length;i++){
    playerName[res[i]["id"]]=res[i]["name"];
  }

  print(playerName);
  
 
  }

 
class ScoreApp extends StatefulWidget {
  const ScoreApp({super.key});
  @override
  State createState() => _ScoreAppState();
}
class _ScoreAppState extends State {

  void clearFlags(){
    wType = -1;
    wBatsman = -1;
    wFielder=-1;
    selectedRun = -1;
    checkWicket = false;
    checkWide = false;
    checkNoBall = false;
    checkByes = false;
    checkLegByes = false;
    setState((){});
  }

void showBowler1(){
  showDialog(context: context,
builder: (context) {
return showBowler();});
}
Widget showBowler(){
  return AlertDialog(
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(bowler1==""?"Bowler":"New Bowler",
              style:const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin:const EdgeInsets.only(top:10),
              width:300,
              height:400,
              child:ListView.builder(
                itemCount: playing1.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      if(wFielder!=index){
                        wFielder=index;
                      }else{
                        wFielder=0;
                      }
                     setState((){});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                        color: wFielder==index?Colors.blue:null,
                        border:Border.all(color: Colors.black),
                      ),
                      
                      child:Text(playerName[playing2[index]]),
                    ),
                  );
                }),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () async{
                  Navigator.pop(context);
                    bowler1=playing2[wFielder];
                    clearFlags();     
                    log("bowler");
                    // await FirebaseFirestore.instance.collection("Student").doc("player1@gmail.com").update({"name":"start"});  
                    if(!bowlers[bowler1].isNotEmpty()){
                      bowlers[bowler1]={"ball":0,"wicket":0,"run":0};
                     inning["bowler"]=bowlers;
                     await FirebaseFirestore.instance.collection("cricket_match").doc(matchID).update({"inning1":inning});    
                    }
                     
                      log("here");
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        );
      }),
    );
}

Future showBatsman1 (int num)async{
  showDialog(context: context,
builder: (context) {
return showBatsman(num+2);});
}
 Widget showBatsman(int num){
    return AlertDialog(
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              num==1?"Batsman1":"Batsman2",
              style:const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin:const EdgeInsets.only(top:10),
              width:300,
              height:400,
              child:ListView.builder(
                itemCount: playing1.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      if(wFielder!=index){
                        wFielder=index;
                      }else{
                        wFielder=0;
                      }
                     setState((){});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                        color: wFielder==index?Colors.blue:null,
                        border:Border.all(color: Colors.black),
                      ),
                      
                      child:Text(playerName[playing1[index]]),
                    ),
                  );
                }),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () async{
                  Navigator.pop(context);
                  if(num==1){
                    batsman1=playing1[wFielder];
                    batsmans[batsman1]={"run":0,"ball":0,"out":false};
                    inning["batsman"]=batsmans;
                    showDialog(context: context,
                    builder: (context) {
                      return showBatsman(2);
                    });
                     clearFlags();
                    await FirebaseFirestore.instance.collection("cricket_match").doc(matchID).update({"inning1":inning});  
                   
                  }else if(num==2){
                    batsman2=playing1[wFielder];
                    batsmans[batsman2]={"run":0,"ball":0,"out":false};
                    inning["batsman"]=batsmans;
                    clearFlags();
                    showDialog(context: context,
                    builder: (context) {
                      return showBowler();
                    });
                    await FirebaseFirestore.instance.collection("cricket_match").doc(matchID).update({"inning1":inning}); 
                  }
                  else if(num==3){
                    batsman1=playing1[wFielder];
                    batsmans[batsman1]={"run":0,"ball":0,"out":false};
                    inning["batsman"]=batsmans;
                     clearFlags();
                    await FirebaseFirestore.instance.collection("cricket_match").doc(matchID).update({"inning1":inning}); 
                  }else{
                    batsman2=playing1[wFielder];
                    batsmans[batsman2]={"run":0,"ball":0,"out":false};
                    inning["batsman"]=batsmans;
                    clearFlags();
                    await FirebaseFirestore.instance.collection("cricket_match").doc(matchID).update({"inning1":inning}); 
                  }
                },
                child: const Text("Next"),
              ),
            ),
          ],
        );
      }),
    );
  }
 
  Widget showWicketFielder(){
    return AlertDialog(
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Fielder",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin:const EdgeInsets.only(top:10),
              width:300,
              height:400,
              child:ListView.builder(
                itemCount: playing2.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      if(wFielder!=index){
                        wFielder=index;
                      }else{
                        wFielder=0;
                      }
                     setState((){});
                    },
                    child: Container(
                       alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                         color: wFielder==index?Colors.blue:null,
                        border:Border.all(color: Colors.black),
                      ),
                      
                      child:Text(playerName[playing2[index]]),
                    ),
                  );
                }),
            ),

            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () async{
                  Navigator.pop(context);
                  var doc=FirebaseFirestore.instance.collection("cricket_match").doc(matchID);
                  if(checkWide || checkNoBall){
                    selectedRun++;
                  }else{
                    ball++;
                  }
                  ballNumber++;
                  wicket++;
                  score+=selectedRun;
                  data.addAll({"$ballNumber":{"wide/no":checkWide?"wide":checkNoBall?"noBall":"NA","byes/leg":checkByes?"byes":checkLegByes?"legByes":"NA","run":selectedRun,"wicket":{"batsman":wBatsman==1?batsman1:batsman2,"bowler":bowler1,"type":wType==2?"bowled":wType==3?"LBW":wType==4?"stumped":wType==6?"hitWicket":"obstraction","fielder":playerName[wFielder]}}});
                  inning["ballNumber"]=data;
                  inning["ball"]=ball;
                  inning["wicket"]=wicket;

                if(checkWide||checkNoBall){
                  bowlers[bowler1]={"run":bowlers[bowler1]["run"]+selectedRun+1,"ball":bowlers[bowler1]["ball"],"wicket":bowlers[bowler1]["wicket"]};
                }else{
                  if(wType==1){
                bowlers[bowler1]={"run":bowlers[bowler1]["run"]+selectedRun,"ball":bowlers[bowler1]["ball"]+1,"wicket":bowlers[bowler1]["wicket"]+1};
                  }else{
                bowlers[bowler1]={"run":bowlers[bowler1]["run"]+selectedRun,"ball":bowlers[bowler1]["ball"]+1,"wicket":bowlers[bowler1]["wicket"]};

                  }
                }

                  if(checkByes||checkLegByes){
                  batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"]+1};
                  batsmans[wBatsman==1?batsman1:batsman2]={"run":batsmans[wBatsman==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"],"out":true,"wType":wType,"wBowler":bowler1,"wFielder":playing2[wFielder]};

                  }else{
                  batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"]+selectedRun,"ball":batsmans[strike==1?batsman1:batsman2]["ball"]+1};
                  batsmans[wBatsman==1?batsman1:batsman2]={"run":batsmans[wBatsman==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"],"out":true,"wType":wType,"wBowler":bowler1,"wFielder":playing2[wFielder]};
                  }

                  await doc.update( {"inning1":inning});
                  if(ball%6==0 && !checkWide && !checkNoBall){
                    showBowler1();
                  }
                   showBatsman1(wBatsman);
                  
                  clearFlags();
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        );
      }),
    );
  }
  Widget showWicketBatsman() {
    return AlertDialog(
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Batsman",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                if (wBatsman == 1) {
                  wBatsman = 0;
                } else {
                  wBatsman = 1;
                }
                setState(() {});
              },
              child: Container(
                  alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                         color: wBatsman == 1 ? Colors.blue : null,
                        border:Border.all(color: Colors.black),
                      ),
                  child:Text(playerName[batsman1])),
            ),
            GestureDetector(
              onTap: () {
                if (wBatsman == 2) {
                  wBatsman = 0;
                } else {
                  wBatsman = 2;
                }
                setState(() {});
              },
              child: Container(
                   alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                         color: wBatsman == 2 ? Colors.blue : null,
                        border:Border.all(color: Colors.black),
                      ),
                  child:Text(playerName[batsman2])),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () async {
                  if(wType==1 || wType==5){
                    
                    if(wType!=0){
                       Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return showWicketFielder();
                        });
                    }
                  }else {
                  Navigator.pop(context);
                  var doc=FirebaseFirestore.instance.collection("cricket_match").doc(matchID);
                  int run=selectedRun;
                  if(checkWide || checkNoBall){
                    run++;
                  }else{
                    ball++;
                  }
                  ballNumber++;
                  wicket++;
                  score+=selectedRun;
                  data.addAll({"$ballNumber":{"wide/no":checkWide?"wide":checkNoBall?"noBall":"NA","byes/leg":checkByes?"byes":checkLegByes?"legByes":"NA","run":run,"wicket":{"batsman":wBatsman==1?batsman1:batsman2,"bowler":bowler1,"type":wType==2?"bowled":wType==3?"LBW":wType==4?"stumped":wType==6?"hitWicket":"obstraction"}}});
                  inning["ballNumber"]=data;
                  inning["ball"]=ball;
                  inning["wicket"]=wicket;
                  if(ball%6==0 && !checkWide && !checkNoBall){
                    showBowler1();
                  }
                  if(checkWide || checkNoBall){
                    if(wType==7){
                    bowlers[bowler1]={"run":bowlers[bowler1]["run"]+selectedRun+1,"ball":bowlers[bowler1]["ball"],"wicket":bowlers[bowler1]["wicket"]};
                    }else{
                    bowlers[bowler1]={"run":bowlers[bowler1]["run"]+selectedRun+1,"ball":bowlers[bowler1]["ball"],"wicket":bowlers[bowler1]["wicket"]+1};
                  }
                  }else{
                    if(wType==7){
                  bowlers[bowler1]={"run":bowlers[bowler1]["run"]+selectedRun,"ball":bowlers[bowler1]["ball"]+1,"wicket":bowlers[bowler1]["wicket"]};
                    }else{
                  bowlers[bowler1]={"run":bowlers[bowler1]["run"]+selectedRun,"ball":bowlers[bowler1]["ball"]+1,"wicket":bowlers[bowler1]["wicket"]+1};

                    }
                  }

                  if(checkByes||checkLegByes){
                  batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"]+1};
                  batsmans[wBatsman==1?batsman1:batsman2]={"run":batsmans[wBatsman==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"],"out":true,"wType":wType,"wBowler":bowler1};

                  }else{
                  batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"]+selectedRun,"ball":batsmans[strike==1?batsman1:batsman2]["ball"]+1};
                  batsmans[wBatsman==1?batsman1:batsman2]={"run":batsmans[wBatsman==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"],"out":true,"wType":wType,"wBowler":bowler1};
                  }
                  await doc.update( {"inning1":inning});

              
                  showBatsman1(wBatsman);
                  clearFlags();
                  }
                },

                child:Text((wType==1 || wType==5)?"OK":"SUBMIT"),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget showWicketType() {
    return AlertDialog(
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Wicket Type",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 10),
            SimpleDialogOption(
              onPressed: () {
                if(!checkNoBall){
                  if (wType == 1) {
                  wType = 0;
                } else {
                  wType = 1;
                }
                setState(() {});
                }
              },
              child: Container(
                  
                  alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                         color: wType == 1 ? Colors.blue : null,
                        border:Border.all(color: Colors.black),
                      ),
                  child:Text('Catch',
                  style: TextStyle(color:checkNoBall?Colors.grey:Colors.black),
                  )),
            ),
            GestureDetector(
              onTap: () {
                if(!checkNoBall){
                  if (wType == 2) {
                  wType = 0;
                } else {
                  wType = 2;
                }
                setState(() {});
                }
              },
              child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                         color: wType == 2 ? Colors.blue : null,
                        border:Border.all(color: Colors.black),
                      ),
                  child:Text('Bowled',
                  style: TextStyle(color:checkNoBall?Colors.grey:Colors.black),
                  )),
            ),
            GestureDetector(
              onTap: () {
                if(!checkNoBall){
                  if (wType == 3) {
                  wType = 0;
                } else {
                  wType = 3;
                }
                setState(() {});
                }
              },
              child: Container(
                   alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                         color: wType == 3 ? Colors.blue : null,
                        border:Border.all(color: Colors.black),
                      ),
                  child:Text('LBW',
                  style: TextStyle(color:checkNoBall?Colors.grey:Colors.black),
                  )),
            ),
            GestureDetector(
              onTap: () {
                if(!checkNoBall){
                  if (wType == 4) {
                  wType = 0;
                } else {
                  wType = 4;
                }
                setState(() {});
                }
              },
              child: Container(
                   alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                         color: wType == 4 ? Colors.blue : null,
                        border:Border.all(color: Colors.black),
                      ),
                  child:Text('Stumped',
                  style: TextStyle(color:checkNoBall?Colors.grey:Colors.black),
                  )),
            ),
            GestureDetector(
              onTap: () {
                if (wType == 5) {
                  wType = 0;
                } else {
                  wType = 5;
                }
                setState(() {});
              },
              child: Container(
                   alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                         color: wType == 5 ? Colors.blue : null,
                        border:Border.all(color: Colors.black),
                      ),
                  child: const Text('Run Out')),
            ),
            GestureDetector(
              onTap: () {
                if(!checkNoBall){
                  if (wType == 6) {
                  wType = 0;
                } else {
                  wType = 6;
                }
                setState(() {});
                }
              },
              child: Container(
                   alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                         color: wType == 6 ? Colors.blue : null,
                        border:Border.all(color: Colors.black),
                      ),
                  child: Text('Hit Wcket',
                  style: TextStyle(color:checkNoBall?Colors.grey:Colors.black),
                  )),
            ),
            GestureDetector(
              onTap: () {
                if (wType == 7) {
                  wType = 0;
                } else {
                  wType = 7;
                }
                setState(() {});
              },
              child: Container(
                   alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin:const EdgeInsets.all(5),
                      width:150,
                      // height:60,
                      decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                         color: wType == 7 ? Colors.blue : null,
                        border:Border.all(color: Colors.black),
                      ),
                  child: const Text('Obstracting field')),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    if(wType!=0){
                       Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return showWicketBatsman();
                        });
                    }
                  });
                },
                child: const Text("OK"),
              ),
            ),
          ],
        );
      }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Team A v/s Team B",
          style: GoogleFonts.oxygen(
              fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 232, 228, 228),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Team A ,1st innings",
                      style: GoogleFonts.oxygen(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "$score-$wicket",
                          style: GoogleFonts.oxygen(
                              fontSize: 38, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "(${ball~/6}.${ball%6})",
                          style: GoogleFonts.quicksand(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              "CRR: ",
                              style: GoogleFonts.oxygen(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "0.00",
                              style: GoogleFonts.quicksand(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 232, 228, 228),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      "Batsman",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    SizedBox(width: 20, height: 20, child: Text("R")),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(width: 20, height: 20, child: Text("B")),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(width: 20, height: 20, child: Text("4s")),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(width: 20, height: 20, child: Text("6s")),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(width: 30, height: 20, child: Text("SR")),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 232, 228, 228),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(batsman1==""?"batsman1":playerName[batsman1],
                      
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(strike == 1 ? "*" : "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    const Spacer(),
                    SizedBox(width: 20, height: 20, child: Text(batsman1!="" ? "${inning["batsman"][batsman1]["run"]}":"0")),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(width: 20, height: 20,child: Text(batsman1!="" ? "${inning["batsman"][batsman1]["ball"]}":"0")),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(width: 20, height: 20, child: Text("0")),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(width: 20, height: 20, child: Text("0")),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(width: 30, height: 20,child: Text(batsman1!="" ? "${inning["batsman"][batsman1]["run"]/inning["batsman"][batsman1]["ball"]}":"0")),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 232, 228, 228),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                   Text(batsman2==""?"batsman2":playerName[batsman2],
                      style:const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(strike == 2 ? "*" : "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    const Spacer(),
                    SizedBox(width: 20, height: 20, child:Text(batsman2!="" ? "${inning["batsman"][batsman2]["run"]}":"0")),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(width: 20, height: 20, child: Text(batsman2!="" ? "${inning["batsman"][batsman2]["ball"]}":"0")),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(width: 20, height: 20, child: Text("0")),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(width: 20, height: 20, child: Text("0")),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(width: 30, height: 20, child: Text(batsman2!="" ? "${inning["batsman"][batsman2]["run"]/inning["batsman"][batsman2]["ball"]}":"0")),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 232, 228, 228),
              ),
              child:const Padding(
                padding:EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text("bowler",

                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    SizedBox(width: 20, height: 20, child: Text("O")),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(width: 20, height: 20, child: Text("M")),
                    SizedBox(
                      width: 15,
                    ),
                     SizedBox(width: 20, height: 20, child: Text("R")),
                     SizedBox(
                      width: 15,
                    ),
                    SizedBox(width: 20, height: 20, child: Text("W")),
                    SizedBox(
                      width: 15,
                    ),
                   SizedBox(width: 30, height: 20, child: Text("ER")),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 232, 228, 228),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child:Padding(
                padding:const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(bowler1==""?"bowler":playerName[bowler1],
                      style:const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(width: 30, height: 20, child:Text("${inning["bowler"][bowler1]["ball"]~/6}.${inning["bowler"][bowler1]["ball"]%6}") 
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(width: 20, height: 20, child: Text("0")),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(width: 20, height: 20, child: Text("0")),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(width: 20, height: 20, child: Text("0")),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(width: 20, height: 20, child: Text("0")),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 232, 228, 228),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "This over: ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Container(
            padding:const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 232, 228, 228),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: Checkbox(
                          value: checkWide,
                          onChanged: (bool? newValue) {
                            if (checkWide == false) {
                              checkWide = true;
                              checkNoBall = false;
                              checkLegByes=false;
                            } else {
                              checkWide = false;
                            }
          
                            setState(() {});
                          }),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Wide",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Checkbox(
                          value: checkNoBall,
                          onChanged: (bool? newValue) {
                            if (checkNoBall == false) {
                              checkWide = false;
                              checkNoBall = true;
                            } else {
                              checkNoBall = false;
                            }
          
                            setState(() {});
                          }),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "No Ball",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Checkbox(
                          value: checkByes,
                          onChanged: (bool? newValue) {
                            if (checkByes == false) {
                              checkByes = true;
                              checkLegByes = false;
                            } else {
                              checkByes = false;
                            }
          
                            setState(() {});
                          }),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Byes",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Checkbox(
                          value: checkLegByes,
                          onChanged: (bool? newValue) {
                            if (checkLegByes == false) {
                              checkLegByes = true;
                              checkByes = false;
                              checkWide=false;
                            } else {
                              checkLegByes = false;
                            }
          
                            setState(() {});
                          }),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Leg Byes",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                   
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Checkbox(
                          value: checkWicket,
                          onChanged: (bool? newValue) {
                            if (checkWicket == false) {
                              checkWicket = true;
                            } else {
                              checkWicket = false;
                            }
          
                            setState(() {});
                          }),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Wicket",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        child: const Text("Retire"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (strike == 1) {
                            strike = 2;
                          } else {
                            strike = 1;
                          }
                          setState(() {});
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        child: const Text("Swap Batsman"),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedRun = 0;
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (selectedRun == 0)
                                ? Colors.red
                                : Colors.amber),
                        child: const Center(child: Text("0")),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedRun = 1;
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (selectedRun == 1)
                                ? Colors.red
                                : Colors.amber),
                        child: const Center(child: Text("1")),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedRun = 2;
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (selectedRun == 2)
                                ? Colors.red
                                : Colors.amber),
                        child: const Center(child: Text("2")),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedRun = 3;
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (selectedRun == 3)
                                ? Colors.red
                                : Colors.amber),
                        child: const Center(child: Text("3")),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedRun = 4;
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (selectedRun == 4)
                                ? Colors.red
                                : Colors.amber),
                        child: const Center(child: Text("4")),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedRun = 5;
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (selectedRun == 5)
                                ? Colors.red
                                : Colors.amber),
                        child: const Center(child: Text("5")),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedRun = 6;
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (selectedRun == 6)
                                ? Colors.red
                                : Colors.amber),
                        child: const Center(child: Text("6")),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedRun = 7;
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (selectedRun == 7)
                                ? Colors.red
                                : Colors.amber),
                        child: const Center(child: Text("7")),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              onPressed: ()async{
                if(batsman1.isEmpty||batsman2.isEmpty){
                  showDialog(context: context,
                    builder: (context) {
                      return showBatsman(1);
                    });
                }else{
                  if(selectedRun!=-1){
                  if(checkWicket==true) {
                   showDialog(
                    context: context,
                    builder: (context) {
                      return showWicketType();
                    });
                }
                else {
                  ballNumber++;
                  var doc= FirebaseFirestore.instance.collection("cricket_match").doc(matchID);
                  int run=selectedRun;
                  if(checkWide){
                      score+=run+1;
                    if(checkByes){
                      data.addAll({"$ballNumber":{"wide/no":"wide","byes/leg":"byes","run":run,}});
                     inning["ballNumber"]=data;
                     inning["ball"]=ball;
                      bowlers[bowler1]={"run":bowlers[bowler1]["run"]+run+1,"ball":bowlers[bowler1]["ball"],"wicket":bowlers[bowler1]["wicket"]};
                    batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"],"out":false};
                    await doc.update( {"inning1":inning});
                  }else{
                     data.addAll({"$ballNumber":{"wide/no":"wide","byes/leg":"NA","run":run,}});
                     inning["ballNumber"]=data;
                     inning["ball"]=ball;
                     bowlers[bowler1]={"run":bowlers[bowler1]["run"]+run+1,"ball":bowlers[bowler1]["ball"],"wicket":bowlers[bowler1]["wicket"]};
                    batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"],"out":false};
                    await doc.update( {"inning1":inning});
                  }
                  }
                  else if(checkNoBall){
                      score+=run+1;
                    if(checkByes){
                      data.addAll({"$ballNumber":{"wide/no":"noBall","byes/leg":"byes","run":run,}});
                   inning["ballNumber"]=data;
                     inning["ball"]=ball;
                      bowlers[bowler1]={"run":bowlers[bowler1]["run"]+run+1,"ball":bowlers[bowler1]["ball"],"wicket":bowlers[bowler1]["wicket"]};
                    batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"]+1,"out":false};
                    await doc.update( {"inning1":inning});
                  }
                  else if(checkLegByes){
                    score+=run;
                     data.addAll({"$ballNumber":{"wide/no":"noBall","byes/leg":"legByes","run":run,}});
                   inning["ballNumber"]=data;
                     inning["ball"]=ball;
                      bowlers[bowler1]={"run":bowlers[bowler1]["run"]+run+1,"ball":bowlers[bowler1]["ball"],"wicket":bowlers[bowler1]["wicket"]};
                    batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"]+1,"out":false};
                    await doc.update( {"inning1":inning});
                }
                else{
                   data.addAll({"$ballNumber":{"wide/no":"noBall","byes/leg":"NA","run":run,}});
                   inning["ballNumber"]=data;
                    inning["ball"]=ball;
                    bowlers[bowler1]={"run":bowlers[bowler1]["run"]+run+1,"ball":bowlers[bowler1]["ball"],"wicket":bowlers[bowler1]["wicket"]};
                    batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"]+run,"ball":batsmans[strike==1?batsman1:batsman2]["ball"]+1,"out":false};
                    await doc.update( {"inning1":inning});
                }
                  }
                 else{
                  ball++;
                  score+=run;
                  if(checkLegByes){
                     data.addAll({"$ballNumber":{"wide/no":"NA","byes/leg":"legByes","run":run,}});
                    inning["ballNumber"]=data;
                     inning["ball"]=ball;
                    bowlers[bowler1]={"run":bowlers[bowler1]["run"]+run,"ball":bowlers[bowler1]["ball"]+1,"wicket":bowlers[bowler1]["wicket"]};
                    batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"]+run,"ball":batsmans[strike==1?batsman1:batsman2]["ball"]+1,"out":false};
                    
                    await doc.update( {"inning1":inning});
                  }else if(checkByes){
                    data.addAll({"$ballNumber":{"wide/no":"NA","byes/leg":"byes","run":run,}});
                    inning["ballNumber"]=data;
                     inning["ball"]=ball;
                    bowlers[bowler1]={"run":bowlers[bowler1]["run"]+run,"ball":bowlers[bowler1]["ball"]+1,"wicket":bowlers[bowler1]["wicket"]};
                    batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"],"ball":batsmans[strike==1?batsman1:batsman2]["ball"]+1,"out":false};
                    await doc.update( {"inning1":inning});
                  }else{
                     data.addAll({"$ballNumber":{"wide/no":"NA","byes/leg":"NA","run":run,}});
                     inning["ballNumber"]=data;
                     inning["ball"]=ball;
                    bowlers[bowler1]={"run":bowlers[bowler1]["run"]+run,"ball":bowlers[bowler1]["ball"]+1,"wicket":bowlers[bowler1]["wicket"]};
                    batsmans[strike==1?batsman1:batsman2]={"run":batsmans[strike==1?batsman1:batsman2]["run"]+run,"ball":batsmans[strike==1?batsman1:batsman2]["ball"]+1,"out":false};
                    clearFlags();
                    await doc.update({"inning1":inning}); 
                  }
                    
                  }
                  if(ball%6==0 && !checkWide && !checkNoBall){
                    showBowler1();
                  }
                }
                }
                if(!checkWicket){
                  clearFlags();
                }
                }
                // FirebaseFirestore.instance.collection("cricket_match").add({"name":"sanket"});
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              child: Text(batsman1.isEmpty||batsman2.isEmpty||bowler1.isEmpty?"Start":"Submit",
                style: GoogleFonts.oxygen(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
