

import "package:flutter/material.dart";

class GroupsApp extends StatefulWidget {
  const GroupsApp({super.key});
  @override
  State createState()=>_GroupsAppState();
}

class _GroupsAppState extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cricket"),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children:[
            const Text("Total teams : 14"),
            const Text("Teams in Group A : 7"),
            const Text("Teams in Group B : 7"),
            const Text("Total Rounds : 5 (including final and semis)"),
            const SizedBox(height: 20,),
            Container(

              // width:400,
              height:60,
              decoration:const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
              child:ListView.builder(
                scrollDirection: Axis.horizontal  ,
                physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                itemBuilder:(context,index){
                  return Container(
                    margin:const EdgeInsets.only(left: 5,right:5),
                    width: MediaQuery.of(context).size.width/2-20,
                    alignment: Alignment.center,
                    padding:const EdgeInsets.all(10),
                    decoration:const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                    child:const Text("Group A"),
                  );
          }
        ),
            ),
        
             Container(
              margin:const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.only(bottom: 5),
              decoration:const BoxDecoration(
              color: Colors.blue,
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
                          itemCount: 8,
                          itemBuilder: (context,index){
                            return Container(
                              height: 50,
                              padding:const EdgeInsets.all(5),
                              margin:const EdgeInsets.only(left:5,right:5,top:5),
                              decoration:const BoxDecoration(
                                color: Colors.white,
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
                              ],
                              ),
                            );
                          }
                          ),
                 ],
               ),
             ),
             ElevatedButton(
              style:const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
              ),
              onPressed:(){},
              child: const Text("create schedule"),

             ),
          ],
        ),
      ),
      

    );
  }
}