import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/View/EditProfile.dart';
import 'package:project2k34/View/LoginPage.dart';
import 'package:project2k34/View/Query_msg.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';
import 'package:project2k34/View/Widgets/shimmer_effect.dart';
import 'package:project2k34/View/Widgets/victroy_vault.dart';
import 'package:project2k34/View/splash_screen03.dart';

class studentHomeScreen extends StatefulWidget {
  @override
  State<studentHomeScreen> createState() => _studentHomeScreenState();
}

class _studentHomeScreenState extends State<studentHomeScreen> {
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
    log("Inside Student home page");
    log("${MySharedPrefrence.isLogin}");
    return Scaffold(
      appBar: MyAppBar(),
       
        drawer: CustomDrawer(
          link: imageurl,
        ),
        body: isLoding ? FullScreenShimmer() : VictoryVault());
  }
}

class CustomDrawer extends StatelessWidget {
  String link = "";
  CustomDrawer({required String this.link});
  bool isSignedIn = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(8, 26, 81, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
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
             
                const SizedBox(height: 10),
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
          // My Matches Section
          _drawerSectionTitle("My Matches"),
          _drawerItem(
              "Cricket", Icons.sports_cricket, context, CricketScreen()),
          _drawerItem(
              "Football", Icons.sports_soccer, context, FootballScreen()),
          _drawerItem(
              "Kabaddi", Icons.sports_kabaddi, context, KabaddiScreen()),
          Divider(color: Colors.white),
          _drawerSectionTitle("Schedule"),
          _drawerItem("Upcoming Matches", Icons.event, context,
              UpcomingMatchesScreen()),
          _drawerItem(
              "Live Events", Icons.live_tv, context, LiveEventsScreen()),
          _drawerItem(
              "Past Matches", Icons.history, context, PastMatchesScreen()),
          Divider(color: Colors.white70),
          // More Options Section
          _drawerSectionTitle("More"),
          _drawerItem("Query", Icons.contact_mail, context, QueryMsg()),
          _drawerItem("Edit Profile", Icons.edit, context, EditProfileScreen()),
          _drawerItem("About", Icons.info, context, AboutScreen()),
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
              log("User logout sucessfully");

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

  Widget _drawerItem(
      String title, IconData icon, BuildContext context, Widget screen) {
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

// Sample Screens for Navigation
class CricketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cricket Matches")),
      body: Center(child: Text("Cricket Matches Screen")),
    );
  }
}

class FootballScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Football Matches")),
      body: Center(child: Text("Football Matches Screen")),
    );
  }
}

class KabaddiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kabaddi Matches")),
      body: Center(child: Text("Kabaddi Matches Screen")),
    );
  }
}

class UpcomingMatchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upcoming Matches")),
      body: Center(child: Text("Upcoming Matches Screen")),
    );
  }
}

class LiveEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Events")),
      body: Center(child: Text("Live Events Screen")),
    );
  }
}

class PastMatchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Past Matches")),
      body: Center(child: Text("Past Matches Screen")),
    );
  }
}

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us")),
      body: Center(child: Text("Contact Us Screen")),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Center(child: Text("About Screen")),
    );
  }
}
