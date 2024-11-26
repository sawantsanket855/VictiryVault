import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:project2k34/View/live_score.dart";
import "package:project2k34/View/scorecard.dart";
import "package:project2k34/View/scorecardNew.dart";

     Widget matchCardLive(BuildContext context,int index,var dataMatch,List matchList,Map cricketTeams){
          return Container(
            height: 250,
            width:350,
            margin:const EdgeInsets.only(right:5,left:5),
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius:BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 173, 210, 241),
             
            ),
             child:Stack(
              children: [
              const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:110,left:50),
                      child: SizedBox(
                        height: 100,
                        width:100,
                        child: const Text("V/S",style:const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),),
                    ),
                  ],
                ),

              Positioned(
                top: 110,
                left:10,
                child:Column(
                  children: [
                    Text(cricketTeams[dataMatch[matchList[index]]["team1"]],
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ),
                Positioned(
                top: 110,
                right:10,
                child:Column(
                  children: [
                    Text(cricketTeams[dataMatch[matchList[index]]["team2"]],
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ),
      
               Positioned(
                top:180,
                  child: SizedBox(
                    width: 340,
                   
                    child: 
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(
                            height: 35,
                            width:150,
                            child: Padding(
                              padding: const EdgeInsets.only(top:4),
                              child: ElevatedButton(
                                onPressed: ()async{
                                  await getScoreCardData(dataMatch[matchList[index]]["id"]);
                                  Navigator.push(context,MaterialPageRoute(
                                    builder: (context){
                                    return ScoreCard();
                                  }
                                  ),
                                  );
                                },
                                 child: const Text("Go Live"),
                              
                                 ),
                            ),
                          ),
                        ],
                      )
                    
                  ),),

                  const Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text ("Cricket",
                            style:TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                            ),
                            Text ("Round 1",
                            style:TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                            ),
                            Text("Match No.4"),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
              
             ),
          );
        
     }


// Widget matchCardCompleted(BuildContext context,int index,var dataMatch,List matchList,Map cricketTeams){
//           return Container(
//             height: 250,
//             width:350,
//             margin:const EdgeInsets.only(right:5,left:5),
//             padding: const EdgeInsets.all(5),
//             decoration: const BoxDecoration(
//               borderRadius:BorderRadius.all(Radius.circular(10)),
//               color: Color.fromARGB(255, 173, 210, 241),
             
//             ),
//              child:Stack(
//               children: [
//               const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top:110,left:50),
//                       child: SizedBox(
//                         height: 100,
//                         width:100,
//                         child: const Text("V/S",style:const TextStyle(
//                         color: Colors.black,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                       ),),),
//                     ),
//                   ],
//                 ),

//               Positioned(
//                 top: 110,
//                 left:10,
//                 child:Column(
//                   children: [
//                     Text(cricketTeams[dataMatch[matchList[index]]["team1"]],
//                       style:const TextStyle(
//                         color: Colors.white,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 ),
//                 Positioned(
//                 top: 110,
//                 right:10,
//                 child:Column(
//                   children: [
//                     Text(cricketTeams[dataMatch[matchList[index]]["team2"]],
//                       style:const TextStyle(
//                         color: Colors.white,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 ),
      
//                Positioned(
//                 top:180,
//                   child: SizedBox(
//                     width: 340,
                   
//                     child: 
//                       Column(
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [

//                           SizedBox(
//                             height: 35,
//                             width:150,
//                             child: Padding(
//                               padding: const EdgeInsets.only(top:4),
//                               child: ElevatedButton(
//                                 onPressed: ()async{
//                                   await getScoreCardData(dataMatch[matchList[index]]["id"]);
//                                   Navigator.push(context,MaterialPageRoute(
//                                     builder: (context){
//                                     return ScoreCard();
//                                   }
//                                   ),
//                                   );
//                                 },
//                                  child: const Text("Scorecard"),
                              
//                                  ),
//                             ),
//                           ),
//                         ],
//                       )
                    
//                   ),),

//                   const Positioned(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Text ("Cricket",
//                             style:TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                             ),
//                             Text ("Round 1",
//                             style:TextStyle(
//                         color: Colors.white,
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold,
//                       ),
//                             ),
//                             Text("Match No.4"),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//               ],
              
//              ),
//           );
        
//      }

   