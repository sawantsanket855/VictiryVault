import "package:flutter/material.dart";

class Schedule1 extends StatefulWidget {
  const Schedule1({super.key});
  @override
  State createState() => _Schedule1State();
}

class _Schedule1State extends State {
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
           padding: EdgeInsets.all(5.0),
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
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                "Groups : ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                  ),
                  GestureDetector(
                    child:Container(
                      padding: const EdgeInsets.all(2),
                      margin:const EdgeInsets.symmetric(horizontal:10),
                    decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                      child: const Icon(Icons.remove))
                  ),
                const Text(
                "4",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                          ),

                GestureDetector(
                    child:Container(
                      padding: const EdgeInsets.all(2),
                      margin:const EdgeInsets.symmetric(horizontal:10),
                    decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                      child: const Icon(Icons.add))
                  ),
              ],
            ),

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  margin:const EdgeInsets.only(top:10),
                  decoration:const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                  height:50,
                  width:MediaQuery.of(context).size.width/2-20,
                  alignment: Alignment.center,
                  child:const Text("Choose Manually",
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
                  width:MediaQuery.of(context).size.width/2-20,
                  child:const Text("Choose Randomely",
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
      ),
            ),
          Container(       
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
              color: Colors.blue, 
            ), 
             margin:const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
             padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child:ListView.builder(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: 16,
              itemBuilder: (context ,index){
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
              },
              )
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
