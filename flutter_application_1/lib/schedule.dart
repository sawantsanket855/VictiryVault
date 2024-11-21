
import "package:flutter/material.dart";
import './detailed_schedule.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
Color? backgroundColor= const Color.fromARGB(255, 36, 38, 39);
Color? appBarColor=  const Color.fromARGB(255, 5, 57, 101);
Color? buttonColor= Colors.white;
Color? contentColor= Colors.white;
dynamic data;
List matches = [];
int teams = 25;
List groups = []; // for group data
int groupCount = 0;
List checkTeam = []; //for checkboxes
int curGroup = 0;
bool selectGroup = false;
Future initializeData() async {
  //get data from firebase
  var response =
      await FirebaseFirestore.instance.collection("cricket_teams").get();
  data = response.docs;
  teams = data.length;
  for (int i = 0; i < teams; i++) {
    checkTeam.add(false);
  }
}

class ScheduleApp extends StatefulWidget {
  const ScheduleApp({super.key});
  @override
  State createState() => _ScheduleAppState();
}

class _ScheduleAppState extends State {
  void selectTeams(int index) {
    if (checkTeam[index] == true) {
      if (groups[curGroup]["teams"].contains(data[index].id)) {
        checkTeam[index] = false;
        groups[curGroup]["teams"].remove(data[index].id);
      }
    } else {
      if (groups[curGroup]["limit"] > groups[curGroup]["teams"].length) {
        checkTeam[index] = true;
        groups[curGroup]["teams"].add(data[index].id);
        // print(groups);
      }
    }

    setState(() {});
  }
 void loaderOn(){
 showDialog(
  barrierDismissible:false,context: context, builder: (BuildContext dialogContext){
    return PopScope(
      canPop:false,
      child:
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              width:50,
              child: Image.asset("assets/loading1.gif"),
            ),
            const SizedBox(height: 5,),
            const Text("wait while schedule be ready.... ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),)
          ],
        ),
      )
    );
  });
  
 }
  void newScreen(){
  Navigator.pop(context);
  Navigator.push(context,MaterialPageRoute(builder: (context){return const DetailedSchedule();}) );
  }
  void createSchedule() async{
     loaderOn();
    int matchLimit = 0;
    if (teams < 33 && teams > 16) {
      matchLimit = 4;
    } else {
      matchLimit = 2;
    }
    Map<String,dynamic> match = {};
    for (int i = 0; i < groupCount; i++) {
      for (int j = 0; j < matchLimit; j++) {
        if (j < (groups[i]["limit"] - 4)) {
          match = {"team1":groups[i]["teams"][0],"team2":groups[i]["teams"][1],"round":"round1"};
          groups[i]["teams"].removeAt(0);
          groups[i]["teams"].removeAt(0);
          var metaData=await FirebaseFirestore.instance.collection("cricket_match").add(match);
          await FirebaseFirestore.instance.collection("cricket_match").doc(metaData.id).update({"id":metaData.id,"winner":"null","time":"null"});
          matches.addAll([metaData.id]);
          FirebaseFirestore.instance.collection("match_list").doc("1KhVXl2BRFJKdISB5TeH").update({"cricket":matches});
        } else {
          match = {"team1":groups[i]["teams"][0],"team2":"bye","round":"round1"};
          var metaData=await FirebaseFirestore.instance.collection("cricket_match").add(match);
          await FirebaseFirestore.instance.collection("cricket_match").doc(metaData.id).update({"id":metaData.id,"winner":"team1","time":"null"});
          matches.addAll([metaData.id]);
          FirebaseFirestore.instance.collection("match_list").doc("1KhVXl2BRFJKdISB5TeH").update({"cricket":matches});
          groups[i]["teams"].removeAt(0);
        }
      }
    }
    if(teams>16){
      //round2
      for(int i=0;i<8;i++){
        match = {"team1":"winner ${i*2+1}","team2":"winner ${i*2+2}","round":"round2"};
          var metaData=await FirebaseFirestore.instance.collection("cricket_match").add(match);
          await FirebaseFirestore.instance.collection("cricket_match").doc(metaData.id).update({"id":metaData.id,"winner":"null","time":"null"});
          matches.addAll([metaData.id]);
          await FirebaseFirestore.instance.collection("match_list").doc("1KhVXl2BRFJKdISB5TeH").update({"cricket":matches});
          await FirebaseFirestore.instance.collection("cricket_match").doc(matches[i*2]).update({"nextMatch":matches[matches.length-1],"nextTeamNumber":"team1"});
          await FirebaseFirestore.instance.collection("cricket_match").doc(matches[i*2+1]).update({"nextMatch":matches[matches.length-1],"nextTeamNumber":"team2"});
     }
     //round3
     for(int i=0;i<4;i++){
      match = {"team1":"winner ${i*2+17}","team2":"winner ${i*2+18}","round":"round3"};
          var metaData=await FirebaseFirestore.instance.collection("cricket_match").add(match);
          await FirebaseFirestore.instance.collection("cricket_match").doc(metaData.id).update({"id":metaData.id,"winner":"null","time":"null"});
          matches.addAll([metaData.id]);
          await FirebaseFirestore.instance.collection("match_list").doc("1KhVXl2BRFJKdISB5TeH").update({"cricket":matches});
          await FirebaseFirestore.instance.collection("cricket_match").doc(matches[i*2+16]).update({"nextMatch":matches[matches.length-1],"nextTeamNumber":"team1"});
          await FirebaseFirestore.instance.collection("cricket_match").doc(matches[i*2+17]).update({"nextMatch":matches[matches.length-1],"nextTeamNumber":"team2"});
     }
     //semiFinal
     for(int i=0;i<2;i++){
      match = {"team1":"winner ${i*2+25}","team2":"winner ${i*2+26}","round":"semiFinal"};
          var metaData=await FirebaseFirestore.instance.collection("cricket_match").add(match);
          await FirebaseFirestore.instance.collection("cricket_match").doc(metaData.id).update({"id":metaData.id,"winner":"null","time":"null"});
          matches.addAll([metaData.id]);
          await FirebaseFirestore.instance.collection("match_list").doc("1KhVXl2BRFJKdISB5TeH").update({"cricket":matches});
          await FirebaseFirestore.instance.collection("cricket_match").doc(matches[i*2+24]).update({"nextMatch":matches[matches.length-1],"nextTeamNumber":"team1"});
          await FirebaseFirestore.instance.collection("cricket_match").doc(matches[i*2+25]).update({"nextMatch":matches[matches.length-1],"nextTeamNumber":"twam2"});
     }
     //final
     match = {"team1":"winner ${29}","team2":"winner ${30}","round":"Final"};
          var metaData=await FirebaseFirestore.instance.collection("cricket_match").add(match);
          await FirebaseFirestore.instance.collection("cricket_match").doc(metaData.id).update({"id":metaData.id,"winner":"null","time":"null"});
          matches.addAll([metaData.id]);
          await FirebaseFirestore.instance.collection("match_list").doc("1KhVXl2BRFJKdISB5TeH").update({"cricket":matches});
          await FirebaseFirestore.instance.collection("cricket_match").doc(matches[28]).update({"nextMatch":matches[matches.length-1],"nextTeamNumber":"team1"});
          await FirebaseFirestore.instance.collection("cricket_match").doc(matches[29]).update({"nextMatch":matches[matches.length-1],"nextTeamNumber":"team2"});

    }
    var matchList=await FirebaseFirestore.instance.collection("match_list").doc("1KhVXl2BRFJKdISB5TeH").get();
    for (int i = 0; i < groupCount; i++) {
      for (int j = 0; j < matchLimit; j++) {
        if (j >= (groups[i]["limit"] - 4)) {
          var response=await FirebaseFirestore.instance.collection("cricket_match").doc(matchList["cricket"][i*matchLimit+j]).get();
          await FirebaseFirestore.instance.collection("cricket_match").doc(response["nextMatch"]).update({response["nextTeamNumber"]:response[response["winner"]]});
        }
      }
    }
  await getData1();
  newScreen();
  

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backgroundColor,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
          );
        }),
        actions: const [
          Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.login,
            color: Colors.white,
          ),
        ],
        title: const Text(
          "VictoryVault",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),
        ),
        backgroundColor:appBarColor,
      ),
      body: ListView(
        children: [
          Container(
            margin:const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: appBarColor,
              borderRadius:const BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)),
            ),
            
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/Cricket.png")),
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
              children: [
                Container(
                  height: 45,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: 20,
                          child: Image.asset("assets/battle.png")),
                      const Text("Matches"),
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset("assets/schedule.png",
                            color: Colors.black),
                      ),
                      const Text("Shedule"),
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: 20,
                          child: const Icon(Icons.leaderboard)
                          // child: Image.asset("assets/sports.png"),
                          ),
                      const Text("Leaderboard"),
                    ],
                  ),
                ),
              ],
            ),
          ),
              ],
            ),
          ),
          
          !selectGroup
              ? Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    // color: Colors.blue,
                  ),
                  margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Groups",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: (){
                              selectGroup = true;
                              if (teams < 33 && teams > 8) {
                                groupCount = 4;
                                int rem = teams % 4;
                                for (int i = 0; i < groupCount; i++) {
                                  if (rem > i) {
                                    groups.add(
                                        {"limit": teams ~/ 4 + 1, "teams": []});
                                  } else {
                                    groups.add(
                                        {"limit": teams ~/ 4, "teams": []});
                                  }
                                }
                              } else if (teams < 9 && teams > 4) {
                                groupCount = 2;
                                int rem = teams % 2;
                                for (int i = 0; i < groupCount; i++) {
                                  if (rem > i) {
                                    groups.add(
                                        {"limit": teams ~/ 2 + 1, "teams": []});
                                  } else {
                                    groups.add(
                                        {"limit": teams ~/ 2, "teams": []});
                                  }
                                }
                              }
                            int count=0;
                            for(int i=0;i<groupCount;i++){
                              for(int j=0;j<groups[i]["limit"];j++){
                                groups[i]["teams"].add(data[count].id);
                                checkTeam[count] = true;
                                count++;
                              }
                            }
                            setState(() {});

                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Text(
                                "create atomatic",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              selectGroup = true;
                              if (teams < 33 && teams > 8) {
                                groupCount = 4;
                                int rem = teams % 4;
                                for (int i = 0; i < groupCount; i++) {
                                  if (rem > i) {
                                    groups.add(
                                        {"limit": teams ~/ 4 + 1, "teams": []});
                                  } else {
                                    groups.add(
                                        {"limit": teams ~/ 4, "teams": []});
                                  }
                                }
                              } else if (teams < 9 && teams > 4) {
                                groupCount = 2;
                                int rem = teams % 2;
                                for (int i = 0; i < groupCount; i++) {
                                  if (rem > i) {
                                    groups.add(
                                        {"limit": teams ~/ 2 + 1, "teams": []});
                                  } else {
                                    groups.add(
                                        {"limit": teams ~/ 2, "teams": []});
                                  }
                                }
                              }
                              // print(groups);
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Text(
                                "create manual",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  decoration:BoxDecoration(
                    borderRadius:const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color:backgroundColor,
                  ),
                  margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Schedule",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          createSchedule();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              color: checkTeam.contains(false)
                                  ? Colors.grey
                                  : Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          Text(
            selectGroup ? "Select Teams" : "Teams",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                selectGroup
                    ? Container(
                        // color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        margin: const EdgeInsets.only(top: 5,bottom: 20),
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
                                child: Column(
                                  children: [
                                    Text(
                                      index == 0
                                          ? "Group A"
                                          : index == 1
                                              ? "Group B"
                                              : index == 3
                                                  ? "Group D"
                                                  : "Group D",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "${groups[index]["teams"].length}/${groups[index]["limit"]}",
                                      style: TextStyle(
                                        color: groups[index]["teams"].length ==
                                                groups[index]["limit"]
                                            ? Colors.red
                                            : Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox(),
                Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Sr.No",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 50),
                        Text(
                          "Team Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 50),
                        Text(
                          "Department Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: teams,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            selectTeams(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom:10,left:5,right:5),
                            padding: const EdgeInsets.only(
                                left: 15, top: 15, bottom: 15),
                            width: MediaQuery.of(context).size.width,
                            // height:80,
                            decoration:BoxDecoration(
                              borderRadius:const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: contentColor,
                            ),
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      selectGroup
                                          ? Container(
                                              margin: const EdgeInsets.only(
                                                  right: 5),
                                              height: 24,
                                              width: 24,
                                              child: Checkbox(
                                                  activeColor: !groups[curGroup]["teams"].contains(data[index].id)? const Color.fromARGB(255,
                220, 218, 218)
                                                      : null,
                                                  value: checkTeam[index],
                                                  onChanged:
                                                      (bool? newValue) {
                                                    selectTeams(index);
                                                  }),
                                            )
                                          : const Text(""),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 30,
                                        child: Text(
                                          "${index + 1}",
                                          style: TextStyle(
                                            fontWeight:
                                                checkTeam[index] == false ||
                                                        groups[curGroup]
                                                                ["teams"]
                                                            .contains(data[index].id)
                                                    ? FontWeight.w500
                                                    : FontWeight.w300,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 140,
                                        child: Text(
                                          data[index]["name"],
                                          style: TextStyle(
                                            fontWeight:
                                                checkTeam[index] == false ||
                                                        groups[curGroup]
                                                                ["teams"]
                                                            .contains(data[index].id)
                                                    ? FontWeight.w500
                                                    : FontWeight.w300,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 140,
                                        child: Text(
                                          data[index]["dept"],
                                          // "${data[0]["dept"]}",
                                          style: TextStyle(
                                            fontWeight:
                                                checkTeam[index] == false ||
                                                        groups[curGroup]
                                                                ["teams"]
                                                            .contains(data[index].id)
                                                    ? FontWeight.w500
                                                    : FontWeight.w300,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
