
import "package:flutter/material.dart";
import "./dep_ranking.dart";
import "./match_card.dart";
class VictoryVault extends StatefulWidget{
  const VictoryVault({super.key});
  @override
  State createState()=>_VictoryVaultState();
}

class _VictoryVaultState extends State{
  bool deptMinCount=true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 38, 39),
      appBar: AppBar(
        actions:const [
           Icon(Icons.leaderboard,
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
      body:Column(
        children: [
          Padding(
                  padding: const EdgeInsets.only(top:15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      Container(
                        height:45,
                        width:120,
                        decoration:const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/Cricket.png"),
                            const Text("Cricket"),
                          ],
                          ),
                      ),
                      Container(
                        height:45,
                        width:120,
                        decoration:const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Image.asset("assets/football.png")),
                            const Text("Football"),
                          ],
                          ),
                      ),
                      Container(
                        height:45,
                        width:120,
                        decoration:const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin:const EdgeInsets.symmetric(horizontal: 10),
                              height: 25,
                              width: 25,
                              child: Image.asset("assets/sports.png")),
                            const Text("Kabaddi"),
                          ],
                          ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
          
          Expanded(
            child: ListView(
              children: [
                  Container(
                    decoration:const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue,
                        ),
                    
                    child: Column(
                      children: [
                        Padding(padding:const EdgeInsets.only(top:0,bottom:0),
                    child: Center(
                      child: SizedBox(
                        height: 100,
                        width:200,
                        child: Stack(
                          children: [
                            Image.asset("assets/label_style.png"),
                            const Padding(
                              padding:EdgeInsets.only(top:40,left:20),
                              child: Text("Leaderboard",
                                style:TextStyle(
                                  fontSize:28,
                                  fontWeight: FontWeight.bold,
                                  // color: Color.fromARGB(255, 223, 160, 25),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // controller: mainPageController,
                          itemCount: deptMinCount?5 :10,
                          itemBuilder: (context,index) {
                            return depRanking();
                          }
                        ),
                        GestureDetector(
                      onTap: (){
                        if(deptMinCount){
                          deptMinCount=false;
                        }else{
                          deptMinCount=true;
                        }
                        
                    
                        setState(() {
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(deptMinCount ?"show more " : "show less ",
                          style:const TextStyle(
                            color: Colors.white,
                          ),
                          ),
                          Icon(deptMinCount?Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded ,color: Colors.white,),
                        ],
                      ),
                    ),
                      ],
                    ),
                  ),
                  const SizedBox(height:25),
                  const Text(" Live Matches",
                  style:TextStyle(
                        fontSize:20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(top:5),
                    height:250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context,index){
                        return matchCardLive(context);
                      },
                      ),
                  ),
            
                  const SizedBox(height:35),
                  const Text(" Upcoming Matches",
                  style:TextStyle(
                        fontSize:20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(top:5),
                    height:250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context,index){
                        return matchCardUpcoming();
                      },
                      ),
                  ),
            
            const SizedBox(height:35),
                  const Text(" Completed Matches",
                  style:TextStyle(
                        fontSize:20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(top:5),
                    height:250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context,index){
                        return matchCardCompleted(context);
                      },
                      ),
                  ),
            
            
              ],
            ),
          ),
        ],
      ),
    );
  }
}