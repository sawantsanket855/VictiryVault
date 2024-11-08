import "package:flutter/material.dart";

class LiveScore extends StatelessWidget {
  const LiveScore({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Live",
          style: TextStyle(
             fontSize:30,
             fontWeight: FontWeight.bold,
             ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children:[
              const Column(
                children: [
                  Text(
                    "Cricket",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Round 3 : Match No.12",
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                margin:const EdgeInsets.all(5),
                padding:const EdgeInsets.all(5),
                color:Colors.white,
                child:const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("First Inning"),
                    Text("Team A",
                     style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    Text("56/5 (3.5)",
                      style:TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    Text("CRR 15.0",
                      style:TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                    ),
          
                  ],),
              ),
              Container(
                      margin:const EdgeInsets.only(top:5),
                      // height: 50,
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue,
                      ),
                      child:Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                
                                const Text("Batter"),
                                const Spacer(),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("R"),
                                ),
                                
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("B"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("4"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("6"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("S/R"),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics:const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context,index){
                              return Container(
                              margin:const EdgeInsets.only(bottom:5,left:5,right:5),
                              height: 50,
                              decoration:const BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  color: Colors.white,
                                                ),
                              child: Row(
                                
                                children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: SizedBox(
                                    height: 44,
                                    width: 33,
                                    child:Image.asset("assets/virat.png",fit:BoxFit.contain),
                                  ),
                                ),
                                const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Virat K",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    Text("b malinga c rahul",
                                    style: TextStyle(
                                    fontSize:11,
                                  ),),
          
                                  ],
                                ),
                                const Spacer(),
          
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("44",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("22",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("4",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("2",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("200.0",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
          
                              ],
                              ),
                            );
                            },
                            
                          ),
                        ],
                      ),
                    ),
          
                    Container(
                      margin:const EdgeInsets.only(top:5),
                      // height: 50,
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue,
                      ),
                      child:Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                
                                const Text("Bowler"),
                                const Spacer(),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("O"),
                                ),
                                
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("M"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("R"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("W"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("Eco"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin:const EdgeInsets.only(bottom:5,left:5,right:5),
                              height: 50,
                              decoration:const BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  color: Colors.white,
                                                ),
                              child: Row(
                                
                                children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: SizedBox(
                                    height: 44,
                                    width: 33,
                                    child:Image.asset("assets/Bumrah.png",fit:BoxFit.cover),
                                  ),
                                ),
                                const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("J Bumrah",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
          
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("3",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("1",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("24",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("2",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("8.0",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
          
                              ],
                              ),
                            ),
                        
                        ],
                      ),
                    ),
          
                    Container(
                      margin:const EdgeInsets.only(top:5,bottom:5),
                      padding: const EdgeInsets.symmetric(horizontal:15,vertical:5),
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue,
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text("recent 10 balls"),
                        SizedBox(
                          width:MediaQuery.of(context).size.width,
                          height:35,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            // shrinkWrap: true,
                            // physics:const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context,index){
                              return Container(
                                alignment: Alignment.center,
                                margin:const EdgeInsets.all(3),
                                height:28,
                                width:28,
                                decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:Colors.white,
                                ),
                                child:const Text("0"),
                              );
                            },
                          ),
                        ),
                      ],
                      ),
                    ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Column(
                    children:[
                      Divider(),
                      Row(
                        children: [
                          Text("18.4",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          SizedBox(width:10),
                          Flexible(child: Text("Ravindra to Kohli, no run")),
                        ],
                      ),
                      ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
