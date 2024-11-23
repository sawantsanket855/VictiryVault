import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonHomePage extends StatefulWidget {
  const CommonHomePage({super.key});

  @override
  State<CommonHomePage> createState() => _CommonHomePageState();
}

class _CommonHomePageState extends State<CommonHomePage> {
  // Player Card Widget
  Widget playerCard() {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 70,
      width: 220,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),  // Light blue background
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F4D6D7A),  // Subtle shadow for depth
            blurRadius: 8,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset("assets/Images/player.jpg", height: 50, width: 50),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Akshay Raut",
                style: TextStyle(
                  fontSize: 14,  // Standard font size for player name
                  fontWeight: FontWeight.bold, 
                  color: Color(0xFF1E3A8A),
                ),
              ),
              Text(
                "Player",
                style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Info Card Widget
  Widget InfoCard({String str = " ", String name = " ", String value = ""}) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 20, top: 10),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F4D6D7A),  // Subtle shadow effect
            blurRadius: 8,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            str,
            height: 35,
            width: 35,
            color: const Color(0xFF4C6BFF),  // Accent color for icons
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,  // Slightly smaller for better balance
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A8A),
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,  // Standard size for values
                  color: Color(0xFF4C6BFF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6), 
       // Soft light grey background for the whole screen
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "DASHBOARD",
                style: TextStyle(
                  fontSize: 20,  // Balanced size for main heading
                  color: Color(0xFF1E3A8A),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Info Cards Section
              Container(
                height: 120,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    InfoCard(str: "assets/Svg/Registration.svg", name: "Registrations", value: "50"),
                    InfoCard(str: "assets/Svg/total.svg", name: "Total Matches", value: "100"),
                    InfoCard(str: "assets/Svg/completed.svg", name: "Completed", value: "50"),
                    InfoCard(str: "assets/Svg/pending.svg", name: "Pending", value: "50"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Gallery Section
              const Text(
                "GALLERY",
                style: TextStyle(
                  fontSize: 20,  // Slightly smaller than the main heading
                  color: Color(0xFF1E3A8A),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Image.asset("assets/Images/ezgif.com-effects.gif"),
              const SizedBox(height: 20),
              // Recent Winners Section
              const Text(
                "Recent Winners",
                style: TextStyle(
                  fontSize: 20,  // Consistent with gallery section heading
                  color: Color(0xFF1E3A8A),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 500,
                child: ListView(
                  children: [
                    playerCard(),
                    playerCard(),
                    playerCard(),
                    playerCard(),
                    playerCard(),
                    playerCard(),
                    

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
