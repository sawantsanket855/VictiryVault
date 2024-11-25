import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';

class RegistrationPlayers extends StatefulWidget {
  const RegistrationPlayers({super.key});

  @override
  State<RegistrationPlayers> createState() => _RegistrationPlayersState();
}

class _RegistrationPlayersState extends State<RegistrationPlayers> {
  List<Map<String, String>> allPlayers = [];
  bool isLoading = true;

  Future<void> getData() async {
    allPlayers.clear();
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Student').get();
    for (var val in snapshot.docs) {
      allPlayers.add({
        "name": val.get('name').toString(),
        "image": val.get("imageurl").toString()
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
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
          : allPlayers.isEmpty
              ? const Center(
                  child: Text(
                    'No Players Found',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: allPlayers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      color: Colors.blue[50],
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue[100],
                          child: ClipOval(
                            child: Image.network(
                              allPlayers[index]["image"]!,
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ),
                          ),
                        ),
                        title: Text(
                          allPlayers[index]["name"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
                          ),
                        ),
                        subtitle: const Text(
                          "Registered Player",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
