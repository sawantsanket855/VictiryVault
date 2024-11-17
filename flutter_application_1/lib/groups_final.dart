import "package:flutter/material.dart";

class GroupsFinal extends StatefulWidget {
  const GroupsFinal({super.key});
  @override
  State createState() => _GroupsFinalState();
}

class _GroupsFinalState extends State {
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
      body: ListView(
        children: [
          const Padding(
            padding:EdgeInsets.all(5),
            child: Text(
                        "Create Schedule",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
          ),

          Container(
            padding:const EdgeInsets.all(10),
             decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
            child: Container(
              padding:const EdgeInsets.all(5),
               decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total teams : 14",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  ),
                  Text("Teams in Group A : 7",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              ),
              Text("Teams in Group B : 7",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              ),
              Text("Total Rounds : 5 (including final and semis)",
              style:TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              ),
                ],
              ),
            ),
          ),
          
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
                padding:const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              // height:480,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
      
                      child:ListView.builder(
                        physics:const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
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
                                SizedBox(width:20),
                              SizedBox(
                                width: 33,
                                child: Text("1.",
                                                
                                ),
                              ),
                              SizedBox(width:10),
                              SizedBox(
                                width: 120,
                                child: Text("dept1 A")),
                                Spacer(),
                                SizedBox(
                                width: 120,
                                child: Text("department1")),
                             
                              Spacer(),
                            ],
                            ),
                          );
                        }
                        ),
          
            ),
            
              ],
            ),
          ),
      
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  margin:const EdgeInsets.only(top:10),
                  decoration:const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                  height:50,
                  width:MediaQuery.of(context).size.width/2-10,
                  alignment: Alignment.center,
                  child:const Text("Edit Table",
                  style: TextStyle(
                    fontSize:17,
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  margin:const EdgeInsets.only(top:10),
                  alignment: Alignment.center,
                  decoration:const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                  height:50,
                  width:MediaQuery.of(context).size.width/2-10,
                  child:const Text("Create Schedule",
                  style: TextStyle(
                    fontSize:17,
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                ),
              ),
            ],
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
