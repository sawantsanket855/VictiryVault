import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/View/point-table/Cricket_Point_Table.dart';
import 'package:project2k34/View/EditProfile.dart';
import 'package:project2k34/View/Match_Result.page.dart';
import 'package:project2k34/View/Query_msg.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';
import 'package:project2k34/View/admin_side_query_page.dart';
import 'package:project2k34/View/all_registrations.dart';
import 'package:project2k34/View/admin_home_page.dart';
import 'package:project2k34/View/point-table/football_pointtable.dart';
import 'package:project2k34/View/point-table/kabaddi_pointtable.dart';
import 'package:project2k34/View/scoring_cricket.dart';
import 'package:project2k34/View/splash_screen03.dart';
import 'package:project2k34/View/upcoming_match.dart';
import 'package:project2k34/View/create_schedule.dart';

class adminHomePage extends StatefulWidget {
  @override
  State<adminHomePage> createState() => _adminHomePageState();
}

class _adminHomePageState extends State<adminHomePage> {
  String imageurl = "";
  bool isLoding = true;
  Future<void> getImageurl() async {
    log("Inside get image url");
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(MySharedPrefrence.myrole)
        .doc(MySharedPrefrence.email)
        .get();
    imageurl = snapshot.get("imageurl").toString();
    setState(() {
      isLoding = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageurl();
    setState(() {
      isLoding = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    log("Inside Admin home page");
    log("${MySharedPrefrence.isLogin}");
    return Scaffold(
    appBar: MyAppBar(),
      drawer: AdminDrawer(link: imageurl,),
      body: CommonHomePage(),
  
     
    );
  }
}

class AdminDrawer extends StatelessWidget {
  bool isSignedIn = false;
  String link="";
  AdminDrawer({required this.link});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(8, 26, 81, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(8, 26, 81, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                  clipBehavior: Clip.antiAlias,
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Image.network(
                    link,
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill, // Ensures the image covers the circle completely
                  ),
                ),
              
                const SizedBox(height: 5),
                Text(
                  MySharedPrefrence.name,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  MySharedPrefrence.email,
                  style: TextStyle(color: Colors.grey[300], fontSize: 14),
                ),
              ],
            ),
          ),
          // Create Schedule Section
          _drawerSectionTitle("Create Schedule"),                        
          _drawerItem("Cricket", Icons.sports_cricket, context, ScheduleApp()),
          _drawerItem("Kabaddi", Icons.sports_kabaddi, context, ScheduleApp()),
          _drawerItem("Football", Icons.sports_soccer, context, ScheduleApp()),
          Divider(color: Colors.white),
          // Add Score Section
          _drawerSectionTitle("Add Score"),
          _drawerItem("Cricket", Icons.sports_cricket, context,ScoreApp()),
          _drawerItem("Kabaddi", Icons.sports_kabaddi, context, AdminMatchPage()),
          _drawerItem("Football", Icons.sports_soccer, context, AddScoreScreen("Football")),
          Divider(color: Colors.white),

           _drawerSectionTitle("Declare Winners"),
          _drawerItem("Cricket", Icons.sports_cricket, context,AdminMatchPage()),
          _drawerItem("Kabaddi", Icons.sports_kabaddi, context, AdminMatchPage()),
          _drawerItem("Football", Icons.sports_soccer, context, AdminMatchPage()),
          Divider(color: Colors.white),

           _drawerSectionTitle("Point Table"),
          _drawerItem("Cricket", Icons.sports_cricket, context,CricketPointsTable()),
          _drawerItem("Kabaddi", Icons.sports_kabaddi, context, KabaddiPointsTable()),
          _drawerItem("Football", Icons.sports_soccer, context, FootballPointsTable()),
          Divider(color: Colors.white),
          // View Queries Section
          _drawerSectionTitle("View Queries"),
          _drawerItem("Queries", Icons.contact_mail, context, AdminSideQueryPage()),
       
      
             _drawerItem("Registrations", Icons.event, context, RegistrationPlayers()),
        
        
           Divider(color: Colors.white),
          // Results Section
          _drawerSectionTitle("More"),
             _drawerItem("Edit Profile", Icons.person_2_sharp, context, EditProfileScreen()),
       
          // Sign Out Button
          ListTile(
            title: Text(
              isSignedIn ? "Sign Out" : "Sign In",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            leading: isSignedIn
                ? Icon(Icons.logout, color: Colors.red)
                : Icon(Icons.login, color: Colors.white),
            onTap: () async {
              await MySharedPrefrence.clearData();
              log("${MySharedPrefrence.isLogin}");
              log("${MySharedPrefrence.email}");
              log("${MySharedPrefrence.name}");
              log("${MySharedPrefrence.myrole}");
              log("Admin logout successfully");

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SplashScreen03()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  // Method to create section titles
  Widget _drawerSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 152, 198, 235),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon, BuildContext context, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {
        
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

// Screens for Create Schedule
// class CreateScheduleScreen extends StatelessWidget {
//   final String game;
//   CreateScheduleScreen(this.game);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Create Schedule - $game")),
//       body: Center(child: Text("Create Schedule for $game")),
//     );
//   }
// }

// Screens for Add Score
class AddScoreScreen extends StatelessWidget {
  final String game;
  AddScoreScreen(this.game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Score - $game")),
      body: Center(child: Text("Add Score for $game")),
    );
  }
}

// Queries Screen
class QueryMsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Queries")),
      body: Center(child: Text("List of Queries")),
    );
  }
}

// Upcoming Matches Screen
class UpcomingMatchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upcoming Matches")),
      body: Center(child: Text("Upcoming Matches Screen")),
    );
  }
}
