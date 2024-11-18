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
                              child: Image.asset("assets/battle.png")),
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
                              
                              child: Image.asset("assets/schedule.png",color: Colors.black),),
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
                Container(
                  margin: const EdgeInsets.only(top: 10),
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
                                      topRight: Radius.circular(10)),
                                      ),
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
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Colors.green,
                                        ),
                                        child:const Text("Team1"),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:30),
                                        height: 28,
                                        width:70,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Colors.red,
                                        ),
                                        child:const Text("Team2"),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:15),
                                        height: 28,
                                        width:70,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Colors.red,
                                        ),
                                        child:const Text("Team3"),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:30),
                                        height: 29,
                                        width:70,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Colors.green,
                                        ),
                                        child:const Text("Team4"),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:14),
                                        height: 29,
                                        width:70,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Colors.red,
                                        ),
                                        child:const Text("Team5"),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:30),
                                        height: 28,
                                        width:70,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Colors.green,
                                        ),
                                        child:const Text("Team6"),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:16),
                                        height: 29,
                                        width:70,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Colors.green,
                                        ),
                                        child:const Text("Team7"),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:30),
                                        height: 28,
                                        width:71,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Colors.red,
                                        ),
                                        child:const Text("Team8"),
                                        ),
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
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Colors.green,
                                        ),
                                        child:const Text("Team1",
                                        ),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:73),
                                        height: 29,
                                        width:72,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Colors.red,
                                        ),
                                        child:const Text("Team4"),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:72),
                                        height: 28,
                                        width:72,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Color.fromARGB(255, 198, 198, 198),
                                        ),
                                        child:const Text("Team6"),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:75),
                                        height: 28,
                                        width:71,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Color.fromARGB(255, 198, 198, 198),
                                        ),
                                        child:const Text("Team7"),
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
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Color.fromARGB(255, 198, 198, 198),
                                        ),
                                        child:const Text("Winner"),
                                        ),
                                        Container(
                                        margin:const EdgeInsets.only(top:176),
                                        height: 28,
                                        width:70,
                                        alignment: Alignment.center,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: Color.fromARGB(255, 198, 198, 198),
                                        ),
                                        child:const Text("Winner"),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(width:37),
                                      
                                  Container(
                                        margin:const EdgeInsets.only(top:193),
                                        height: 28,
                                        width:71,
                                        decoration:const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color:  Color.fromARGB(255, 198, 198, 198),
                                        ),
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
                ),
            
                const Padding(
                  padding:EdgeInsets.only(top:40,left:20,bottom:5),
                  child:Text("Matches",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                ),
            
                Container(        
                  decoration:const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10),
                    ),
                    color: Colors.blue, 
                  ), 
                   margin:const EdgeInsets.symmetric(horizontal: 5,),
                   padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child:ListView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context ,index){
                      return 
                      Container(
                        margin:const EdgeInsets.only(top: 10),
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
                          const Text("Match : 01",
                          style:TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Container(
                              alignment: Alignment.bottomRight,
                              width:100,
                              child: const Text("Team A",
                                style:TextStyle(
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
                              child: const Text("Team B",
                              style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                              ),
                              ),
                          ],),
            
                          const Center(
                            child:Text("match starts at Today 8:30 AM",
                            style:TextStyle(
                              color: Color.fromARGB(255, 248, 137, 1),
                            )
                            ))
                          ]
                        ),
                        );
                    },
                    )
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
