import 'package:flutter/material.dart';


class PlayerInformation extends StatefulWidget {
  const PlayerInformation({super.key});

  @override
  State<PlayerInformation> createState() => _PlayerInformationState();
}

class _PlayerInformationState extends State<PlayerInformation> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: const Color.fromARGB(255, 36, 38, 39),
      // appBar: MyAppBar(), //body
      body: ListView(
        children:[ Container(
          padding: EdgeInsets.only(top: 50,bottom: MediaQuery.of(context).viewInsets.bottom),
          
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  department image-logo
              Container(
                height: 150,
                width: 150,
                child: Image.asset("assets/Images/player.jpg"),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
        
              //input fields 
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.white),
                
                  )
                ),
              ),
                Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "ZPRN NO",
                    labelStyle: TextStyle(color: Colors.white),
                
                  )
                ),
              ),
                Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "age",
                    labelStyle: TextStyle(color: Colors.white),
                
                  )
                ),
              ),
                Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "gender ",
                    labelStyle: TextStyle(color: Colors.white),
                
                  )
                ),
              ),
                Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "contact no",
                    labelStyle: TextStyle(color: Colors.white),
                
                  )
                ),
              ),
               Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "department Name",
                    labelStyle: TextStyle(color: Colors.white),
                
                  )
                ),
              ),
               Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text("Submit",style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,

                ),)
              ),
             
        
        
        
        
            ],
          
          ),
        ),
        ]
      ),
      
      
    );

  }
}