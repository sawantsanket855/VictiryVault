import "dart:developer";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:cloud_firestore/cloud_firestore.dart";
Color? listcolor = Colors.amber.shade50;
String matchID = "6HpA76ZNgBD4Yqv1PrTD";
Color? containercolor = const Color.fromARGB(255, 29, 54, 88);
Color? buttextcolor = Colors.white;
Color? shadow = Colors.black;
Map bowlers1={};
Map batsmans1 = {};
Map bowlers2={};
Map batsmans2 = {};
Map players = {};
List batsmansKey1 = [];
List bowlersKey1 = [];
List batsmansKey2 = [];
List bowlersKey2 = [];
String bat="";
String bowl="";
dynamic response;
String didNotPlay2="";
String didNotPlay1="";
Future getScoreCardData() async {
  // var response=await FirebaseFirestore.instance.collection("cricket_match").doc("matchID").get();
  log("start");
  response = await FirebaseFirestore.instance
      .collection("cricket_match")
      .doc(matchID)
      .get();
  var response1 = await FirebaseFirestore.instance.collection("Student").get();
  var data = response1.docs;
  for (var i in data) {
    players[i["id"]] = i["name"];
  }
  List playing1 = response["playing1"];
  List playing2 = response["playing2"];
  if(response["inning1"]["batsman"]!=null){
    batsmans1 = response["inning1"]["batsman"];
    bowlers1 = response["inning1"]["bowler"];
    batsmansKey1 = batsmans1.keys.toList();
    bowlersKey1 = bowlers1.keys.toList();
  }
  if(response["status"]>4){
    batsmans2 = response["inning2"]["batsman"];
    bowlers2 = response["inning2"]["bowler"];
    batsmansKey2 = batsmans2.keys.toList();
    bowlersKey2 = bowlers2.keys.toList();
  }
  
 




  var t1=await FirebaseFirestore.instance.collection("cricket_teams").doc(response["team1"]).get();
  var t2=await FirebaseFirestore.instance.collection("cricket_teams").doc(response["team2"]).get();
  String team1=t1["name"];
  String team2=t2["name"];
  log("team1 $team1  $team2");
  if((response["toss"]["won"]=="team1" && response["toss"]["choose"]=="bat") || (response["toss"]["won"]=="team2" && response["toss"]["choose"]=="bowl")){
      bat=team1;
      bowl=team2;
    }else{
     bat=team2;
     bowl=team1;
    }

 
  for(int i=0; i<playing1.length;i++){
    if(bat==team1){
      log("here1");
      if(!batsmans1.containsKey(playing1[i])){
        log("here");
        didNotPlay1+= "${players[playing1[i]]}  " ;
      }
    }else{
       if(!batsmans1.containsKey(playing1[i])){
        log("here");
        didNotPlay2+="${players[playing1[i]]}  " ;
      }
    }
  }


 
  for(int i=0; i<playing2.length;i++){
    if(bowl==team2){
      log("here1");
      if(!batsmans2.containsKey(playing2[i])){
        log("here");
        didNotPlay2+="${players[playing2[i]]}  " ;
      }
    }else{
      if(!batsmans2.containsKey(playing2[i])){
        log("here");
        didNotPlay1+="${players[playing2[i]]}  " ;
      }
    }
  }
}


class ScoreCard extends StatefulWidget {
  const ScoreCard({super.key});
  @override
  State createState()=>_ScoreCard();
}
class _ScoreCard extends State {

  String curInning="inning1";

  Widget wicketLabel(int index) {
    if (curInning=="inning1"){
      if (batsmans1[batsmansKey1[index]]["out"] == true) {
      if(batsmans1[batsmansKey1[index]]["wType"]==1){
        return Row(
        children: [
          Text("b ${players[batsmans1[batsmansKey1[index]]["wBowler"]]}  ",
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
          Text("c ${players[batsmans1[batsmansKey1[index]]["wFielder"]]}",
          style: const TextStyle(
              fontSize: 11,
            ),),
        ],
      );
      }else if(batsmans1[batsmansKey1[index]]["wType"]==2){
        return Text("b ${players[curInning=="inning1"?batsmans1[batsmansKey1[index]]["wBowler"]:batsmans2[batsmansKey2[index]]["wBowler"]]}",
            style: const TextStyle(
              fontSize: 11,
            ),
          );
      }else if(batsmans1[batsmansKey1[index]]["wType"]==3){
        return Text("lbw ${players[curInning=="inning1"?batsmans1[batsmansKey1[index]]["wBowler"]:batsmans2[batsmansKey2[index]]["wBowler"]]}",
            style: const TextStyle(
              fontSize: 11,
            ),
          );
      }else if(batsmans1[batsmansKey1[index]]["wType"]==4){
         return Text("b ${players[curInning=="inning1"?batsmans1[batsmansKey1[index]]["wBowler"]:batsmans2[batsmansKey2[index]]["wBowler"]]} st",
            style: const TextStyle(
              fontSize: 11,
            ),
          );
      }else if(batsmans1[batsmansKey1[index]]["wType"]==5){
        return Text( curInning=="inning1"?"run out (${players[batsmans1[batsmansKey1[index]]["wFielder"]]})":"run out (${players[batsmans2[batsmansKey2[index]]["wFielder"]]})",
            style: const TextStyle(
              fontSize: 11,
            ),
          );
      }else if(batsmans1[batsmansKey1[index]]["wType"]==6){
        return Text("hit wk${players[curInning=="inning1"?batsmans1[batsmansKey1[index]]["wBowler"]:batsmans2[batsmansKey2[index]]["wBowler"]]}",
            style: const TextStyle(
              fontSize: 11,
            ),
          );
      }else{
        return const Text("obstr field");
      }
    }else{
      return const Text("not out");
    }
    }else{
      if (batsmans2[batsmansKey2[index]]["out"] == true) {
      if(batsmans2[batsmansKey2[index]]["wType"]==1){
        return Row(
        children: [
          Text("b ${players[batsmans2[batsmansKey2[index]]["wBowler"]]}  ",
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
          Text("c ${players[batsmans2[batsmansKey2[index]]["wFielder"]]}",
          style: const TextStyle(
              fontSize: 11,
            ),),
        ],
      );
      }else if(batsmans1[batsmansKey1[index]]["wType"]==2){
        return Text("b ${players[batsmans2[batsmansKey2[index]]["wBowler"]]}",
            style: const TextStyle(
              fontSize: 11,
            ),
          );
      }else if(batsmans1[batsmansKey1[index]]["wType"]==3){
        return Text("lbw ${players[batsmans2[batsmansKey2[index]]["wBowler"]]}",
            style: const TextStyle(
              fontSize: 11,
            ),
          );
      }else if(batsmans1[batsmansKey1[index]]["wType"]==4){
         return Text("b ${players[batsmans2[batsmansKey2[index]]["wBowler"]]} st",
            style: const TextStyle(
              fontSize: 11,
            ),
          );
      }else if(batsmans1[batsmansKey1[index]]["wType"]==5){
        return Text("run out (${players[batsmans2[batsmansKey2[index]]["wFielder"]]})",
            style: const TextStyle(
              fontSize: 11,
            ),
          );
      }else if(batsmans2[batsmansKey2[index]]["wType"]==6){
        return Text("hit wk${players[batsmans2[batsmansKey2[index]]["wBowler"]]}",
            style: const TextStyle(
              fontSize: 11,
            ),
          );
      }else{
        return const Text("obstr field");
      }
    }else{
      return const Text("not out");
    }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Victory Vault",
            style: GoogleFonts.blackOpsOne(
              shadows: const [
                Shadow(
                  offset: Offset(5, 5),
                  blurRadius: 10,
                  color: Colors.black,
                ),
              ],
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          backgroundColor: containercolor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListView(
            children: [
              Column(
                children: [
                  Text("Cricket",
                      style: GoogleFonts.sairaStencilOne(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      )),
                  Text(
                    "Round 3 : Match No.12",
                    style: GoogleFonts.pridi(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap:(){
                            if (curInning=="inning2"){
                              curInning="inning1";
                              setState((){});
                              log(curInning);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: curInning=="inning1"? Colors.yellow :Colors.yellow.shade50,
                            ),
                            child: Column(
                              children: [
                                Text(bat,
                                    style: GoogleFonts.gloock(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Colors.black,
                                    )),
                                 response["status"]>2? 
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text("${response["inning1"]["score"]}",
                                      style: GoogleFonts.pridi(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),),
                                      Text("/${response["inning1"]["wicket"]}",
                                      style: GoogleFonts.pridi(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),),
                                      Text("  (${response["inning1"]["ball"]~/6}. ${response["inning1"]["ball"]%6})",
                                      style: GoogleFonts.pridi(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      )
                                      )
                                   ],
                                 ):Text("0/0  (0.0)", 
                                  style: GoogleFonts.pridi(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      )),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap:(){
                            if (curInning=="inning1"){
                              curInning="inning2";
                              setState((){});
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            color:curInning=="inning2"? Colors.yellow :Colors.yellow.shade50,
                            child: Column(
                              children: [
                                Text(bowl,
                                    style: GoogleFonts.gloock(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Colors.black,
                                    )),
                                response["status"]>4? 
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text("${response["inning2"]["score"]}",
                                      style: GoogleFonts.pridi(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),),
                                      Text("/${response["inning2"]["wicket"]}",
                                      style: GoogleFonts.pridi(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),),
                                      Text("  (${response["inning2"]["ball"]~/6}. ${response["inning2"]["ball"]%6})",
                                      style: GoogleFonts.pridi(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      )
                                      )
                                   ],
                                 ):Text("0/0  (0.0)",
                                  style: GoogleFonts.pridi(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                      color: containercolor,
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Batter",
                            style: GoogleFonts.gloock(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: buttextcolor,
                            )),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 35,
                          // color: Colors.red,
                          child: Text("R",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 35,
                          child: Text("B",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 35,
                          // color: Colors.red,
                          child: Text("4",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 35,
                          child: Text("6",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 35,
                          child: Text("S/R",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: buttextcolor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:curInning=="inning1"? batsmansKey1.length : batsmansKey2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              height: 50,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    offset: const Offset(2, 2),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: listcolor,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SizedBox(
                                      height: 44,
                                      width: 33,
                                      child: Image.asset("assets/player.png",
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        players[curInning=="inning1"?batsmansKey1[index]:batsmansKey2[index]],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      wicketLabel(index),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text(
                                      curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["run"]}":"${batsmans2[batsmansKey2[index]]["run"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text(
                                      curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["ball"]}":"${batsmans2[batsmansKey2[index]]["ball"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text(
                                       curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["four"]}":"${batsmans2[batsmansKey2[index]]["four"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text(
                                       curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["six"]}":"${batsmans2[batsmansKey2[index]]["six"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child:Text(
                                      curInning=="inning1"?((batsmans1[batsmansKey1[index]]["run"])/(batsmans1[batsmansKey1[index]]["ball"])*100).toStringAsFixed(1):((batsmans2[batsmansKey2[index]]["run"])/(batsmans2[batsmansKey2[index]]["ball"])*100).toStringAsFixed(1),
                                      style:const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(
                      10,
                    ),
                    // height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: containercolor,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:const EdgeInsets.only(left: 15, top: 5),
                          child: Text("Did Not Bat",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: listcolor,
                          ),
                          child: Row(
                            children: [
                              Text(curInning=="inning1"?didNotPlay1:didNotPlay2,
                                style: GoogleFonts.pridi(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                  color: containercolor,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Bowler",
                        style: GoogleFonts.gloock(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: buttextcolor,
                        )),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 30,
                      width: 35,
                      // color: Colors.red,
                      child: Text("O",
                          style: GoogleFonts.gloock(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: buttextcolor,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 30,
                      width: 35,
                      child: Text("M",
                          style: GoogleFonts.gloock(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: buttextcolor,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 30,
                      width: 35,
                      // color: Colors.red,
                      child: Text("R",
                          style: GoogleFonts.gloock(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: buttextcolor,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 30,
                      width: 35,
                      child: Text("W",
                          style: GoogleFonts.gloock(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: buttextcolor,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 30,
                      width: 35,
                      child: Text("Eco",
                          style: GoogleFonts.gloock(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: buttextcolor,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: buttextcolor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: curInning=="inning1"? bowlersKey1.length:bowlersKey2.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.7),
                                offset: const Offset(2, 2),
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: listcolor,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  height: 44,
                                  width: 33,
                                  child: Image.asset("assets/player.png",
                                      fit: BoxFit.contain),
                                ),
                              ),
                              Text(
                                players[curInning=="inning1"? bowlersKey1[index]:bowlersKey2[index]],
                                style:const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                alignment: Alignment.center,
                                height: 30,
                                width: 35,
                                // color: Colors.red,
                                child: Text(curInning=="inning1"? "${bowlers1[bowlersKey1[index]]["ball"]~/6}.${bowlers1[bowlersKey1[index]]["ball"]%6}":"${bowlers2[bowlersKey2[index]]["ball"]~/6}.${bowlers2[bowlersKey2[index]]["ball"]%6}",
                                  style:const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                alignment: Alignment.center,
                                height: 30,
                                width: 35,
                                // color: Colors.red,
                                child: const Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                alignment: Alignment.center,
                                height: 30,
                                width: 35,
                                // color: Colors.red,
                                child:Text(
                                 curInning=="inning1"? "${bowlers1[bowlersKey1[index]]["run"]}":"${bowlers2[bowlersKey2[index]]["run"]}",
                                  style:const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                alignment: Alignment.center,
                                height: 30,
                                width: 35,
                                // color: Colors.red,
                                child: Text(
                                  curInning=="inning1"? "${bowlers1[bowlersKey1[index]]["wicket"]}":"${bowlers2[bowlersKey2[index]]["wicket"]}",
                                  style:const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                alignment: Alignment.center,
                                height: 30,
                                width: 35,
                                // color: Colors.red,
                                child:Text(
                                 curInning=="inning1"?((bowlers1[bowlersKey1[index]]["run"]) / (bowlers1[bowlersKey1[index]]["ball"]) *6 ).toStringAsFixed(1):((bowlers2[bowlersKey2[index]]["run"]) / (bowlers2[bowlersKey2[index]]["ball"]) *6 ).toStringAsFixed(1),
                                  style:const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
