import "package:flutter/material.dart";

class ScheduleApp extends StatefulWidget {
  const ScheduleApp({super.key});
  @override
  State createState()=>_ScheduleAppState();
}

class _ScheduleAppState extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading:const Icon(Icons.keyboard_arrow_left_rounded,size: 30,),
        title: const Text("Cricket",
          style:TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration:const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
            child: Row(children: [
              const Text("create groups : "),
              GestureDetector(
                child:Container(
                  margin:const EdgeInsets.only(right:10),
                  decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                  child: const Icon(Icons.remove,size:20)),
              ),
              const Text("2"),
              GestureDetector(
                child:Container(
                  margin:const EdgeInsets.only(left:10),
                  decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                  child: const Icon(Icons.add,size:20)),
              ),
              const Spacer(),
              Column(
                children: [
                  Container(
                    padding:const EdgeInsets.all(5),
                    decoration:const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                    child: const Text("create manually"),
                  ),
                  const SizedBox(height: 5,),
              Container(
                padding:const EdgeInsets.all(5),
                decoration:const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                child: const Text("create atomatic"),
              ),
                ],
              ),
              
              
            ],),
          ),
          const SizedBox(height: 20,),
          const Text("Teams",
             style:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          Container(
            padding:const EdgeInsets.only(bottom: 10,top:5),
            decoration:const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top:5,left:10,bottom:5),
                  child: Row(
                          children: [
                          SizedBox(
                            width: 33,
                            child: Text("Sr.no",
                                            
                            ),
                          ),
                          SizedBox(width:10),
                          SizedBox(
                            width: 120,
                            child: Text("team name")),
                            SizedBox(
                            width: 120,
                            child: Text("department")),
                          SizedBox(width:10),
                          Text("players : 13"),
                          Spacer(),
                        ],),
                ),
                ListView.builder(
                  physics:const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 14,
                  itemBuilder: (context,index){
                    return Container(
                      
                      padding:const EdgeInsets.all(5),
                      margin:const EdgeInsets.only(left:5,right:5,top:5),
                      decoration:const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child:const Row(
                        children: [
                        SizedBox(
                          width: 33,
                          child: Text("1.",
                                          
                          ),
                        ),
                        SizedBox(width:10),
                        SizedBox(
                          width: 120,
                          child: Text("dept1 A")),
                          SizedBox(
                          width: 120,
                          child: Text("department1")),
                        SizedBox(width:10),
                        Text("players : 13"),
                        Spacer(),
                      ],),
                    );
                  }
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}