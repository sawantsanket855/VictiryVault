import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';
import 'package:project2k34/View/Widgets/shimmer_effect.dart';

class CricketPointsTable extends StatefulWidget {
  @override
  State<CricketPointsTable> createState() => _CricketPointsTableState();
}

class _CricketPointsTableState extends State<CricketPointsTable> {
  List<Map<String, dynamic>> pointsData = [];
  bool isLoding=true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      pointsData.clear();
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("PointTable")
          .doc("cricketPointTable")
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        List<dynamic> sortedList = data.values.toList()
          ..sort((a, b) => b['points'].compareTo(a['points']));

        Map<String, dynamic> updatedData = {};
        for (int i = 0; i < sortedList.length; i++) {
          updatedData['${i + 1}'] = sortedList[i];
          pointsData.add(sortedList[i]);
        }

        await FirebaseFirestore.instance
            .collection("PointTable")
            .doc("cricketPointTable")
            .set(updatedData);

        setState(() {
          isLoding=false;
        }); // Refresh UI
      } else {
        log("Document does not exist.");
      }
    } catch (e) {
      log("Error fetching points data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: 
      isLoding ?
      FullScreenShimmer():
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Table Header
            Container(
              color: Colors.blue[100],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(flex: 2, child: Text('Department', style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Text('P', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Text('W', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Text('L', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Text('NRR', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Text('Points', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Table Rows
            Expanded(
              child: pointsData.isEmpty
                  ? Center(
                      child: Text(
                        'No data available',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: pointsData.length,
                      itemBuilder: (context, index) {
                        final data = pointsData[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                            color: index % 2 == 0 ?  const Color.fromARGB (255, 255, 198, 225) :Colors.blue[50],
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(flex: 2, child: Text(data['department'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                              Expanded(child: Text(data['p'].toString(), textAlign: TextAlign.center)),
                              Expanded(child: Text(data['w'].toString(), textAlign: TextAlign.center)),
                              Expanded(child: Text(data['l'].toString(), textAlign: TextAlign.center)),
                              Expanded(child: Text(data['nrr'].toString(), textAlign: TextAlign.center)),
                              Expanded(child: Text(data['points'].toString(), textAlign: TextAlign.center)),
                              
                            ],
                          ),
                        );
                      },
                    ),
            ),
            Container(
              height: 300,
              child:  Image.asset("assets/Images/pointtable.png")
            )
          ],
        ),
      ),
    );
  }
}

