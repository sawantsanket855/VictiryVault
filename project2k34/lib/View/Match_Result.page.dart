import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';

class MatchResultCard extends StatefulWidget {
  final String team1;
  final String team2;
  final String team1Image;
  final String team2Image;

  MatchResultCard({
    required this.team1,
    required this.team2,
    required this.team1Image,
    required this.team2Image,
  });

  @override
  _MatchResultCardState createState() => _MatchResultCardState();
}

class _MatchResultCardState extends State<MatchResultCard> {
  String? selectedWinner;
  String? winningMethod;
  String matchResult = '';

  // List of winning methods to select from
  final List<String> winningMethods = [
    'By Runs',
    'By Wickets',
    'By D/L Method',
    'Match Tied',
  ];

  // Function to declare the result
  void declareResult() {
    if (selectedWinner != null && winningMethod != null) {
      setState(() {
        matchResult = '$selectedWinner won $winningMethod';
      });
   
    } else {
      setState(() {
        matchResult = 'Please select the winner and winning method.';
      });
    }
  }

  // Fresh color gradients




  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 6), // Further reduced vertical margin
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Slightly rounded corners
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors:  [const Color.fromARGB(0, 101, 207, 239), const Color.fromARGB(146, 172, 79, 233)], // Using fresh pink-orange gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(8.0), // Reduced padding for smaller height
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Team 1 Logo and Name
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20, // Further reduced logo size
                      backgroundImage: AssetImage(widget.team1Image),
                    ),
                    const SizedBox(height: 4), // Reduced space
                    Text(
                      widget.team1,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(width: 4), // Reduced width for spacing
                Text(
                  'VS', 
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(width: 4), // Reduced width for spacing
                // Team 2 Logo and Name
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20, // Further reduced logo size
                      backgroundImage: AssetImage(widget.team2Image),
                    ),
                    const SizedBox(height: 4), // Reduced space
                    Text(
                      widget.team2,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6), // Further reduced space
            // Winner selection
            Row(
              children: [
                Text('Winner: ', style: TextStyle(fontSize: 12, color: Colors.white)),
                DropdownButton<String>(
                  hint: Text('Select Winner', style: TextStyle(color: Colors.white)),
                  value: selectedWinner,
                  items: [widget.team1, widget.team2].map((String team) {
                    return DropdownMenuItem<String>(
                      value: team,
                      child: Text(team, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedWinner = newValue;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 4), // Reduced space
            // Winning method selection
            Row(
              children: [
                Text('How they won: ', style: TextStyle(fontSize: 12, color: Colors.white)),
                DropdownButton<String>(
                  hint: Text('Select Method', style: TextStyle(color: Colors.white)),
                  value: winningMethod,
                  items: winningMethods.map((String method) {
                    return DropdownMenuItem<String>(
                      value: method,
                      child: Text(method, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      winningMethod = newValue;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 6), // Reduced space
            // Declare result button
            ElevatedButton(
              onPressed: declareResult,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 48, 199, 14), // Changed button color to amber
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12), // Reduced padding
              ),
              child: const Text('Declare Result', style: TextStyle(fontSize: 12, color: Colors.black)),
            ),
            const SizedBox(height: 4), // Reduced space
            // Match result display
            if (matchResult.isNotEmpty)
              Text(
                matchResult,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 76, 15, 220)),
              ),
          ],
        ),
      ),
    );
  }
}

class AdminMatchPage extends StatelessWidget {
  final List<Map<String, String>> matches = [
    {'team1': 'Computer Science', 'team2': 'Mechanical', 'team1Image': 'assets/cs_logo.png', 'team2Image': 'assets/mechanical_logo.png'},
    {'team1': 'Electrical', 'team2': 'Civil', 'team1Image': 'assets/electrical_logo.png', 'team2Image': 'assets/civil_logo.png'},
    {'team1': 'Mechanical', 'team2': 'Electrical', 'team1Image': 'assets/mechanical_logo.png', 'team2Image': 'assets/electrical_logo.png'},
    {'team1': 'Computer Science', 'team2': 'Civil', 'team1Image': 'assets/cs_logo.png', 'team2Image': 'assets/civil_logo.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: matches.length,
          itemBuilder: (context, index) {
            return MatchResultCard(
              team1: matches[index]['team1']!,
              team2: matches[index]['team2']!,
              team1Image: matches[index]['team1Image']!,
              team2Image: matches[index]['team2Image']!,
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AdminMatchPage(),
  ));
}
