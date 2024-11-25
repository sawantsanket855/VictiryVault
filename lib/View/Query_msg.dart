import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';
import 'package:project2k34/View/Widgets/myScaffold.dart';

class QueryMsg extends StatefulWidget {
  const QueryMsg({super.key});

  @override
  State<QueryMsg> createState() => _QueryMsgState();
}

class _QueryMsgState extends State<QueryMsg> {
  TextEditingController queryContoller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 300, child: Image.asset("assets/Images/query.png")),
            const Text(
              "Enter your Query",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Text("Query",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ))
              ],
            ),
            Container(
              width: 350,
              child: TextField(
                controller: queryContoller,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: "Write your Qery here ! ",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
            ),
                GestureDetector(
                  onTap:()async {
                    String phoneNumber="-";
                    FocusScope.of(context).unfocus();
                    if(queryContoller.text.isNotEmpty){
                    DocumentSnapshot snapshot=await   FirebaseFirestore.instance.collection(MySharedPrefrence.myrole).doc
                    (MySharedPrefrence.email).get();
                    if(snapshot.exists){
                       phoneNumber=snapshot['mobile'];
                    }
                     await FirebaseFirestore.instance.collection("queryData").doc(MySharedPrefrence.email+DateTime.now().toString()).set(
                        {
                          "query":queryContoller.text,
                          "date": DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
                          "mobile": phoneNumber,
                          "email":MySharedPrefrence.email,
                          "docid":MySharedPrefrence.email+DateTime.now().toString(),
                          "isResolved":false,
                          
                        }
                      );
                      Myscaffold.myNormalScaffold(context,text: "Query Registerd Sucessfully");
                      
                    }
                  
                  },
                  child: Container(
                    margin: EdgeInsets.only(top:20,bottom: 20),
                              height: 50,
                              width: 300,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 23, 35, 97),
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 243, 240, 240),
                                    fontSize: 20),
                              ),
                            ),
                ),

          ],
        ),
      ]),
    );
  }
}
