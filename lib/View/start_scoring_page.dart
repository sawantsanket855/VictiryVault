import "dart:developer";

import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "./scoring.dart";

dynamic dataList;
dynamic dataTeams;
dynamic dataMatch;
Map cricketTeams={};
Map cricketMatch={};

bool scheduleCreated =false;
Future getMatchData()async{
  try{
    var response = await FirebaseFirestore.instance.collection("match_list").doc("F2889lT50WRVFwqEKVlC").get();
    var response1 = await FirebaseFirestore.instance.collection("cricket_match").get();
    var response2 = await FirebaseFirestore.instance.collection("cricket_teams").get();
    dataTeams=response2.docs;
    dataList=response;
    dataMatch = response1.docs;
     for(int i=0;i<dataMatch.length;i++){
    cricketMatch[dataMatch[i]["id"]]={"team1":dataMatch[i]["team1"],"team2":dataMatch[i]["team2"],"winner":dataMatch[i]["winner"],"time":dataMatch[i]["time"],"status":dataMatch[i]["status"]};
  }
 for(int i=0;i<dataTeams.length;i++){
    cricketTeams[dataTeams[i]["id"]]=dataTeams[i]["name"];
  }
    var res=response["cricket"].length;
    scheduleCreated=true;
    log(" data present");
  }catch(e){
    log("schedule not created");
  }
}


class StartScoring extends StatefulWidget {
  const StartScoring({super.key});
  @override
  State createState() => _StartScoring();
}

class _StartScoring extends State {

  Future refresh()async{
    await getMatchData();
    setState(() {
    });
  }

  void getTossDetails(String matchID){
    int overs=4;
   String selectedTeam="null";
   String selectedChoice="null";
   showDialog(context: context,
   builder: (context) {
   return AlertDialog(
    title: const Text("Toss"),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Column(children: [
                  const Padding(
                    padding:EdgeInsets.only(bottom: 5.0),
                    child:Text("won"),
                  ),
                  GestureDetector(
                    onTap:(){
                      if(selectedTeam=="team1"){
                        selectedTeam="null";
                      }else{
                        selectedTeam="team1";
                      }
                      setState((){});
                    },
                    child: Container(
                       alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin:const EdgeInsets.all(5),
                      width:100,
                      // height:60,
                      decoration:BoxDecoration(
                        color: selectedTeam=="team1"?Colors.blue :null,
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                        border:Border.all(color: Colors.black),
                      ),
                      child: const Text("team1"),
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      if(selectedTeam=="team2"){
                        selectedTeam="null";
                      }else{
                        selectedTeam="team2";
                      }
                      setState((){});
                    },
                    child: Container(
                       alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin:const EdgeInsets.all(5),
                      width:100,
                      // height:60,
                      decoration:BoxDecoration(
                        color: selectedTeam=="team2"?Colors.blue :null,
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                        border:Border.all(color: Colors.black),
                      ),
                      child: const Text("team2"),
                    ),
                  ),
                ]),
                const SizedBox(width:20),
                Column(children: [
                  const Padding(
                    padding:EdgeInsets.only(bottom: 5.0),
                    child:Text("choose"),
                  ),
                  GestureDetector(
                    onTap:(){
                      if(selectedChoice=="bat"){
                        selectedChoice="null";
                      }else{
                        selectedChoice="bat";
                      }
                      setState((){});
                    },
                    child: Container(
                       alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin:const EdgeInsets.all(5),
                      width:100,
                      // height:60,
                      decoration:BoxDecoration(
                        color: selectedChoice=="bat"?Colors.blue :null,
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                        border:Border.all(color: Colors.black),
                      ),
                      child: const Text("bat"),
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      if(selectedChoice=="bowl"){
                        selectedChoice="null";
                      }else{
                        selectedChoice="bowl";
                      }
                      setState((){});
                    },
                    child: Container(
                       alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin:const EdgeInsets.all(5),
                      width:100,
                      // height:60,
                      decoration:BoxDecoration(
                        color: selectedChoice=="bowl"?Colors.blue :null,
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                        border:Border.all(color: Colors.black),
                      ),
                      child: const Text("bowl"),
                    ),
                  ),
                ])
              ],
            ),
            const SizedBox(height:15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Overs: "),
                GestureDetector(
                  onTap:(){
                    if(overs>1){
                      overs--;
                      setState((){});
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(5)),
                        border:Border.all(color: Colors.black),
                      ),
                    child:const Icon(Icons.remove),
                  ),
                ),
                Text("$overs",
                style:const TextStyle(fontWeight: FontWeight.bold),),
                GestureDetector(
                  onTap:(){
                    if(overs<20){
                      overs++;
                      setState((){});
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(5)),
                        border:Border.all(color: Colors.black),
                      ),
                    child:const Icon(Icons.add),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: ()async {
                if(selectedTeam!="null" && selectedChoice!=(null)){
                  await FirebaseFirestore.instance.collection("cricket_match").doc(matchID).update({"toss":{"won":selectedTeam,"choose":selectedChoice},"status":2,"totalOvers":overs});
                  Navigator.pop(context);
                  await refresh();
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 40,
                margin:const EdgeInsets.only(top:20),
                padding: const EdgeInsets.all(5),
                decoration:BoxDecoration(
                  color: Colors.blue,
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                        border:Border.all(color: const Color.fromARGB(255, 2, 47, 84)),
                      ),
                child: const Text("Submit")
              )
            )
          ]
        );
        }
        ));
     });}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: ListView(
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
            !scheduleCreated ?const Padding(
              padding: EdgeInsets.only(top:200.0),
              child: Center(
              child:Text("schedule is not created yet ....",
              style: TextStyle(
                color: Colors.white,
              ),),),
            ):

            Column(
              children: [
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
                        cricketMatch[dataList["cricket"][index]]["winner"]!="null"?
                        Center(
                          child:Text("completed : team ${cricketTeams[cricketMatch[dataList["cricket"][index]][cricketMatch[dataList["cricket"][index]]["winner"]]]} won the match",
                          style:const TextStyle(
                            color: Color.fromARGB(255, 248, 137, 1),
                          )
                          )):

                          cricketTeams[cricketMatch[dataList["cricket"][index]]["team1"]]!=null && cricketTeams[cricketMatch[dataList["cricket"][index]]["team1"]]!=null ? 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            GestureDetector(
                              onTap:(){
                                if(cricketMatch[dataList["cricket"][index]]["status"]<2){
                                  getTossDetails(dataList["cricket"][index]);
                                }

                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin:const EdgeInsets.symmetric(vertical:5),
                                padding:const EdgeInsets.symmetric(horizontal:10,vertical:5),
                                decoration:BoxDecoration(
                                    borderRadius:const BorderRadius.all(Radius.circular(10),
                                   ),
                                   color:cricketMatch[dataList["cricket"][index]]["status"]<2?Colors.blue:Colors.grey),
                                height:35,
                                width: 100,
                                child: const Text("toss"),
                              ),
                            ),
                            GestureDetector(
                              onTap:()async{
                                if(cricketMatch[dataList["cricket"][index]]["status"]>1 && cricketMatch[dataList["cricket"][index]]["status"]<4){
                                  await getData(dataList["cricket"][index],"inning1");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const ScoreApp();
                                    }));
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin:const EdgeInsets.symmetric(vertical:15),
                                padding:const EdgeInsets.symmetric(horizontal:10,vertical:5),
                                decoration:BoxDecoration(
                                    borderRadius:const BorderRadius.all(Radius.circular(10),
                                   ),
                                   color:cricketMatch[dataList["cricket"][index]]["status"]>1 && cricketMatch[dataList["cricket"][index]]["status"]<4 ? Colors.blue :Colors.grey),
                                height:35,
                                width: 100,
                                child: const Text("inning 1"),
                              ),
                            ),
                            GestureDetector(
                              onTap:()async{
                                if(cricketMatch[dataList["cricket"][index]]["status"]>3){
                                  await getData(dataList["cricket"][index],"inning2");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const ScoreApp();
                                    }));
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin:const EdgeInsets.symmetric(vertical:5),
                                padding:const EdgeInsets.symmetric(horizontal:10,vertical:5),
                                decoration:BoxDecoration(
                                    borderRadius:const BorderRadius.all(Radius.circular(10),
                                   ),
                                   color:cricketMatch[dataList["cricket"][index]]["status"]>3?Colors.blue :Colors.grey),
                                height:35,
                                width: 100,
                                child: const Text("inning 2"),
                              ),
                            )
                          ],)
                          :const  Center(
                          child:Text("upcoming",
                          style:TextStyle(
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
            
         
          ],
        ));
  }
}
