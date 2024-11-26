import "package:flutter/material.dart";
import "package:project2k34/View/Widgets/depRank.dart";
import "package:project2k34/View/dep_ranking.dart";
import "package:project2k34/View/match_card.dart";
import "package:cloud_firestore/cloud_firestore.dart";



dynamic dataMatch;
dynamic dataList;
dynamic dataTeams;
Map cricketTeams={};
List cricketMatch1=[];
List cricketMatch2=[];

Future getData3()async{
  var response = await FirebaseFirestore.instance.collection("match_list").doc("F2889lT50WRVFwqEKVlC").get();
  var response1 = await FirebaseFirestore.instance.collection("cricket_match").get();
  var response2 = await FirebaseFirestore.instance.collection("cricket_teams").get();
  dataTeams=response2.docs;
  dataList=response;
  dataMatch = response1.docs;
  for(int i=0;i<dataMatch.length;i++){
    if(dataMatch[i]["status"]>1 && dataMatch[i]["status"]<6){
          cricketMatch1.add(i);
    }else if(dataMatch[i]["status"]> 5){
       cricketMatch2.add(i);
    }

    }
 for(int i=0;i<dataTeams.length;i++){
    cricketTeams[dataTeams[i]["id"]]=dataTeams[i]["name"];
  }
// print(cricketTeams[cricketMatch[dataList["cricket"][0]]["team1"]]);
  // print(cricketMatch[dataList["cricket"][0]]["team1"]);
  // print(cricketTeams);
  // print(cricketMatch);
  
  print(cricketMatch1);
  print(cricketMatch2);

}
class VictoryVault extends StatefulWidget {
  const VictoryVault({super.key});
  @override
  State createState() => _VictoryVaultState();
}

class _VictoryVaultState extends State {
  bool deptMinCount = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for a clean look

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Cricket Button
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(10)),
                    color: Colors
                        .blue.shade50, // Light blue background for freshness
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/Images/Cricket.png"),
                      const Text("Cricket",
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
                // Football Button
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green.shade50, // Light green background
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                          child: Image.asset("assets/Images/football.png")),
                      const Text("Football",
                          style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ),
                // Kabaddi Button
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.orange.shade50, // Light orange background
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/Images/sports.png"),
                      ),
                      const Text("Kabaddi",
                          style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 500,
                  child: DepartmentRankingWithPhotos(isappbar: false),
                ),
                // Leaderboard Section

                const SizedBox(height: 25),

                // Live Matches Section
                const Text(
                  "Live Matches",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cricketMatch1.length,
                    itemBuilder: (context, index){
                      
                      return matchCardLive(context,index,dataMatch,cricketMatch1,cricketTeams);
                    },
                  ),
                ),

                const SizedBox(height: 35),

                // Upcoming Matches Section

                const SizedBox(height: 35),

                // Completed Matches Section
                // const Text(
                //   "Completed Matches",
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                // ),
                // Container(
                //   margin: const EdgeInsets.only(top: 5),
                //   height: 250,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 6,
                //     itemBuilder: (context, index) {
                //       return matchCardCompleted(context,index,dataMatch,cricketMatch2,cricketTeams);
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}