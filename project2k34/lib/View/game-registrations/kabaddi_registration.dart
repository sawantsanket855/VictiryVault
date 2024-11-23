import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';
import 'package:project2k34/View/Widgets/myScaffold.dart';
import 'package:project2k34/View/Widgets/shimmer_effect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KabaddiRegistration extends StatefulWidget {
  const KabaddiRegistration({super.key});

  @override
  State<KabaddiRegistration> createState() => _KabaddiRegistrationState();
}

class _KabaddiRegistrationState extends State<KabaddiRegistration> {
  String department = "";
  List<String> playersName = [];
  List<String> allPlayerNames = [];
  bool isLoding = true;

  Future<void> getRoleAndData() async {
    playersName.clear();
    allPlayerNames.clear();

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
        allPlayerNames = List<String>.from(departmentSnapshot.get('students'));
          try {
          selectedPlayerList =
              List<String>.from(departmentSnapshot.get('kabaddiTeam'));
        } catch (e) {
          selectedPlayerList = [];
        }



        // Fetch player names for each player ID in the department
        for (int i = 0; i < allPlayerNames.length; i++) {
          DocumentSnapshot playerSnapshot = await FirebaseFirestore.instance
              .collection("Student")
              .doc(allPlayerNames[i])
              .get();

          if (playerSnapshot.exists) {
            playersName.add(playerSnapshot.get('name').toString());
          } else {
            print('Player not found: ${allPlayerNames[i]}');
          }
        }
      } else {
        allPlayerNames = [];  // Empty the list if department doesn't exist
      }
    } catch (e) {
      print("Error fetching data: $e");
      allPlayerNames = [];
      playersName = [];
    }
    setState(() {
      isLoding = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // Fetch the role and player data when the widget initializes
    getRoleAndData().then((_) {
      setState(() {});  // Trigger UI update after data fetching is complete
    });
  }

   List<String> selectedPlayerList = [];

  Color selectedColor(int index) {
    if (index != 0 && index <= selectedPlayerList.length) {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color SelectColorforCard(int index) {
    if (selectedPlayerList.contains(allPlayerNames[index])) {
      return Color.fromRGBO(182, 255, 161, 1);
    } else {
      return Color.fromRGBO(212, 246, 255, 1);
    }
  }

  Widget playerNameCard(int index) {
    return GestureDetector(
      onTap: () {
        if (selectedPlayerList.contains(allPlayerNames[index])) {
          selectedPlayerList.remove(allPlayerNames[index]);
        } else if (selectedPlayerList.length == 7) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Maximum 7 players can be selected")));
        } else {
          selectedPlayerList.add(allPlayerNames[index]);
          if (selectedPlayerList.length == 7) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Maximum 7 players can be selected")));
          }
        }

        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 70,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: SelectColorforCard(index),
        ),
        child: Row(
          children: [
            const Text("  1"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset("assets/Images/player.jpg", height: 50, width: 50),
            ),
            Text("Player Name: ${playersName[index]}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 36, 38, 39),
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: isLoding
          ? FullScreenShimmer()
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 37,
                            width: 37,
                            alignment: Alignment.center,
                            child: Text("${++index}"),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedColor(index),
                                border: Border.all(color: Colors.black, width: 0.5)),
                          );
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Select 7 Kabaddi Players",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: allPlayerNames.length,
                      itemBuilder: (context, index) {
                        return playerNameCard(index);
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection("dataDepartment")
                          .doc(department)
                          .update({
                        'kabaddiTeam': selectedPlayerList,
                      });
                      Myscaffold.myNormalScaffold(context, text: "Team Selection done !");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        child: Text("Submit"),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
