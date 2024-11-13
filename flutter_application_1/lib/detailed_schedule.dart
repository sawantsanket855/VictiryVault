import "package:flutter/material.dart";

class DetailedSchedule extends StatefulWidget {
  const DetailedSchedule({super.key});
  @override
  State createState() => _DetailedScheduleState();
}

class _DetailedScheduleState extends State {
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          const SizedBox(height:20),
          const Text(
            "Schedule",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),

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
          Container(
            margin: const EdgeInsets.only(top: 30),
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color:Colors.white,
            ),
            
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10),
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 4 - 10,
                        decoration: BoxDecoration(
                            color: index == 1 ? Colors.blue : null,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: const Text(
                          "Group A",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            
              Container(
              alignment: Alignment.center,
              height:430,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.blue,
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
                        child: Image.asset("assets/schedule_diagram/team8.png", fit: BoxFit.fill,)),
                                
                        Row(
                          children: [
                            const SizedBox(width:5),
                            Column(
                              children: [
                                Container(
                                  margin:const EdgeInsets.only(top:4),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Team1"),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:30),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Team2"),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:15),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Team3"),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:30),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Team4"),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:16),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Team5"),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:30),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Team6"),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:16),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Team7"),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:31),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Team8"),
                                  ),
                              ],
                            ),
                            const SizedBox(width:41),
                                
                            Column(
                              children:[
                                
                                 Container(
                                  margin:const EdgeInsets.only(top:33),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Winnner1",
                                  ),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:73),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Winner2"),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:73),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Winner3"),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:75),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Winner4"),
                                  ),
                                  ],
                            ),
                            const SizedBox(width: 40,),
                                
                            Column(
                              children: [
                                Container(
                                  margin:const EdgeInsets.only(top:91),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Winner5"),
                                  ),
                                  Container(
                                  margin:const EdgeInsets.only(top:176),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Winner6"),
                                  ),
                              ],
                            ),
                            const SizedBox(width:40),
                                
                            Container(
                                  margin:const EdgeInsets.only(top:12),
                                  height: 28,
                                  width:68,
                                  alignment: Alignment.center,
                                  child:const Text("Winner7"),
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
          ),

          const SizedBox(height: 10,),

          Container(
              alignment: Alignment.center,
              height:430,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.blue,
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
                child: Image.asset("assets/schedule_diagram/team4f.png", fit: BoxFit.fill,)),

                Row(
                  children: [
                    const SizedBox(width:39),
                    Column(
                      children: [
                        Container(
                          margin:const EdgeInsets.only(top:50),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team1"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:47),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team2"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:25),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team3"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:47),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team4"),
                          ),                          
                      ],
                    ),
                    const SizedBox(width:44),

                    Column(
                      children:[
                        
                         Container(
                          margin:const EdgeInsets.only(top:91),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Winnner1",
                          ),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:107),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Winner2"),
                          ),
                          ],
                    ),

                  ],
                ),
                
                    Container(
                      margin:const EdgeInsets.only(top:173,left:281),
                      height: 35,
                      width:77,
                      alignment: Alignment.center,
                      child:const Text("Winner3"),
                      ),
            ],
          ),
        ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
