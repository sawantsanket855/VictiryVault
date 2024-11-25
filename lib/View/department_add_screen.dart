import 'package:flutter/material.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';

class DepartmentAddScreen extends StatefulWidget {
  const DepartmentAddScreen({super.key});

  @override
  State<DepartmentAddScreen> createState() => _DepartmentAddScreenState();
}

class _DepartmentAddScreenState extends State<DepartmentAddScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: const Color.fromARGB(255, 36, 38, 39),
    // appBar: MyAppBar(),//body
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
                child: Image.asset("assets/Images/departmentlogo.jpg"),
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
                    labelText: "Department Name",
                    labelStyle: TextStyle(color: Colors.white),
                
                  )
                ),
              ),
                Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Department id",
                    labelStyle: TextStyle(color: Colors.white),
                
                  )
                ),
              ),
                Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "HOD Manager",
                    labelStyle: TextStyle(color: Colors.white),
                
                  )
                ),
              ),
                Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "contact Number",
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
        Row(children: [
          
        ],)
        ]
      ),
      
      
    );

  }
}