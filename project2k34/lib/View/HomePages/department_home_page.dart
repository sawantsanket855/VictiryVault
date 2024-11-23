import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/View/game-registrations/Cricket_Registration.dart';
import 'package:project2k34/View/EditProfile.dart';
import 'package:project2k34/View/game-registrations/Football_Registration.dart';
import 'package:project2k34/View/TeamRegistrationPage.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';
import 'package:project2k34/View/game-registrations/kabaddi_registration.dart';
import 'package:project2k34/View/splash_screen03.dart';
import 'package:project2k34/View/upcoming_match.dart';


class DepartmentHomePage extends StatefulWidget {
  @override
  State<DepartmentHomePage> createState() => _DepartmentHomePageState();
}

class _DepartmentHomePageState extends State<DepartmentHomePage> {
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
    log("Inside Department home page");
    log("${MySharedPrefrence.isLogin}");
    return Scaffold(
      appBar: MyAppBar(),
      drawer: DepartmentDrawer(link: imageurl,),
      body: Center(
        child: Text(
          "Welcome to Department Home Page",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class DepartmentDrawer extends StatelessWidget {
  bool isSignedIn = false;
  String link="";
  DepartmentDrawer({required String this.link});

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
          // Team Management Section
          _drawerSectionTitle("Team Selection"),
          _drawerItem("Cricket", Icons.sports_cricket, context, CricketRegistration()),
          _drawerItem("Football", Icons.sports_soccer, context, FootballRegistration()),
          _drawerItem("Kabaddi", Icons.sports_kabaddi, context, KabaddiRegistration()),

          Divider(color: Colors.white),

           _drawerSectionTitle("Register Team"),
          _drawerItem("Cricket", Icons.sports_cricket, context, Teamregistrationpage(sport: "cricket")),
          _drawerItem("Football", Icons.sports_soccer, context, Teamregistrationpage(sport:"football")),
          _drawerItem("Kabaddi", Icons.sports_kabaddi, context, Teamregistrationpage(sport: "kabaddi")),

          // Match Schedule Section
          _drawerSectionTitle("Schedules"),
          _drawerItem("View Schedules", Icons.calendar_today, context, UpcomingMatches()),
          Divider(color: Colors.white),
          // Results Section
          _drawerSectionTitle("Results"),
          _drawerItem("View Results", Icons.emoji_events, context, ResultsPage()),
          Divider(color: Colors.white),
          // More Section
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
              log("Department logout successfully");

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

// Example Screens
class TeamManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Team Management")),
      body: Center(child: Text("Manage Teams")),
    );
  }
}

class RegisterTeamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Teams")),
      body: Center(child: Text("Register Teams Here")),
    );
  }
}

class MatchScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Match Schedules")),
      body: Center(child: Text("View Match Schedules")),
    );
  }
}

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Results")),
      body: Center(child: Text("View Results Here")),
    );
  }
}
