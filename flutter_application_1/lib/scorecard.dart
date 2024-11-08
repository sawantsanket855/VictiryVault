import "package:flutter/material.dart";

class ScoreCard extends StatelessWidget{
  const ScoreCard({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title:const Text("Scorecard",
          style: TextStyle(
             fontSize:30,
             fontWeight: FontWeight.bold,
             ),
          ),
        ),

        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: ListView(
            children:[
              Column(
                children: [
                  const Text("Cricket",
                  style:TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Text("Round 3 : Match No.12",
                  style:TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration:const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue,),
                          child:const Column(
                            children: [
                              Text("Team B",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("50/3 (3.4)",
                    style:TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // height: 60,
                          // width:300,
                          color: Colors.white,
                            child:const Column(
                            children: [
                              Text("Team B",
                      style:TextStyle(
                        // color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("50/3 (3.4)",
                    style:TextStyle(
                        // color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                          itemCount: 5,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const Padding(
                          padding:EdgeInsets.only(left:15,top:5),
                          child:Text("Did Not Bat"),
                        ),
                        Container(
                          margin:const EdgeInsets.symmetric(horizontal: 5,vertical:5),
                          padding:const EdgeInsets.all(10),
                          decoration:const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child:const Row(
                            children: [
                              Text("rohit, suresh, surya, mohit"),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ),
                ],
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
                        ListView.builder(
                          shrinkWrap: true,
                          physics:const NeverScrollableScrollPhysics(),
                          itemCount: 5,
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