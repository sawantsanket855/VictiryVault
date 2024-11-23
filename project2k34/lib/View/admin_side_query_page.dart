import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';
import 'package:project2k34/View/Widgets/myScaffold.dart';
import 'package:project2k34/View/query_card.dart';

class AdminSideQueryPage extends StatefulWidget {
  const AdminSideQueryPage({super.key});

  @override
  State<AdminSideQueryPage> createState() => _AdminSideQueryPageState();
}

class _AdminSideQueryPageState extends State<AdminSideQueryPage> {
  List<Map<String, dynamic>> queries = [];
  bool isLoading = true;

  // function to send mail

  Future<void> getQueries() async {
    try {
      queries.clear(); // Clear the list before fetching data
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("queryData")
          .get();

      for (var val in snapshot.docs) {
        queries.add(val.data() as Map<String, dynamic>);
      }

      setState(() {
        isLoading = false; // Stop showing the loader
      });
    } catch (e) {
      log("Error fetching queries: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getQueries(); // Fetch the queries when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: MyAppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,

              ),
            )
          : queries.isEmpty
              ?  Center(
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Text(
                        "No queries available",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Image.asset("assets/Images/done.png")
                    ],
                  ),
                )
              : Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "All Queries",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: queries.length,
                        itemBuilder: (context, index) {
                          // return QueryCard(queryMessage: queries[index]['query'], name: queries[index]['date'],emailaddress: queries[index]['email'],docid:queries[index]['docid']);
                          return QueryCard(m1: queries[index],);

                          
            
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
