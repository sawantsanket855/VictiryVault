import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/Controller/Storage_operation.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';
import 'package:project2k34/View/Widgets/myScaffold.dart';

class Teamregistrationpage extends StatefulWidget {
  String sport;
   Teamregistrationpage({super.key,required String this.sport});

  @override
  State<Teamregistrationpage> createState() => _TeamregistrationpageState();
}

class _TeamregistrationpageState extends State<Teamregistrationpage> {
  String department = "";
  XFile? selectedFile;
  StorageOperation storageOperation = StorageOperation();
  String url = "";
  List<Map<String, String>> playersDetails = [];
  bool isLoding = true;
  List<String> selectedPlayerList = [];

  @override
  Future<void> getRoleAndData() async {
    String teamname=widget.sport+"Team";
    playersDetails.clear();

    try {
      // Fetching the department from the user's document
      DocumentSnapshot roleSnapshot = await FirebaseFirestore.instance
          .collection(MySharedPrefrence.myrole)
          .doc(MySharedPrefrence.email)
          .get();

      if (roleSnapshot.exists) {
        department = roleSnapshot.get('department').toString();
      }

      // Fetching the department data
      DocumentSnapshot departmentSnapshot = await FirebaseFirestore.instance
          .collection("dataDepartment")
          .doc(department)
          .get();

      if (departmentSnapshot.exists) {
        selectedPlayerList =
            List<String>.from(departmentSnapshot.get(teamname));

        // Fetch player names for each player ID in the department
        for (int i = 0; i < selectedPlayerList.length; i++) {
          DocumentSnapshot playerSnapshot = await FirebaseFirestore.instance
              .collection("Student")
              .doc(selectedPlayerList[i])
              .get();

          if (playerSnapshot.exists) {
            String name = playerSnapshot.get('name').toString();
            String imageurl = playerSnapshot.get('imageurl').toString();
            playersDetails.add({'name': name, 'url': imageurl});
          } else {}
        }
      } else {
        log("Error");
      }
    } catch (e) {
      print("Error fetching data: $e");

      playersDetails = [];
    }
    setState(() {
      isLoding = false;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getRoleAndData();
  }

  Widget playerNameCard(int index) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 70,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(212, 246, 255, 1)),
      child: Row(
        children: [
          const Text("  1"),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(playersDetails[index]['url']!,
                height: 50, width: 50),
          ),
          Text("Player Name: ${playersDetails[index]['name']}"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    log("playersDetails ${playersDetails}");
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                selectedFile = await StorageOperation.pickImage();
                String fileName =
                    selectedFile!.name + DateTime.now().toString();
                if (selectedFile != null) {
                  await storageOperation.uploadeImage(
                      fileName: fileName, selectedFile: selectedFile!);
                  setState(() {});
                }
                url = await storageOperation.downloadImgUrl(fileName: fileName);
              },
              child: Container(
                height: 120,
                width: 120,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(60)),
                child: selectedFile == null
                    ? Image.network("https://cdn-icons-png.flaticon.com/512/3616/3616929.png", fit: BoxFit.fill)
                    : Image.file(File(selectedFile!.path), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Upload Logo", textAlign: TextAlign.center),
            const SizedBox(height: 20),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: playersDetails.length,
                itemBuilder: (context, index) {
                  return playerNameCard(index);
                },
              ),
            ),
            GestureDetector(
              onTap: () async {
                FirebaseFirestore.instance.collection("dataDepartment").doc(department).update(
                  {
                    widget.sport+"logo":url 
                  }
                );
                Myscaffold.myNormalScaffold(context,
                    text: "Team Selction done !");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  child: Text("Register"),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
