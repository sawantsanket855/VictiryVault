import 'package:flutter/material.dart';

class UpcomingMatches extends StatelessWidget {
  final List<Map<String, String>> matchList = [
    {
      'teamA': 'India',
      'teamALogo': 'assets/Images/player.jpg',
      'teamB': 'Australia',
      'teamBLogo': 'assets/Images/player.jpg',
      'date': '2024-11-20',
      'time': '14:00',
      'venue': 'Wankhede Stadium, Mumbai',
    },
    {
      'teamA': 'England',
      'teamALogo': 'assets/Images/player.jpg',
      'teamB': 'South Africa',
      'teamBLogo': 'assets/Images/player.jpg',
      'date': '2024-11-22',
      'time': '18:30',
      'venue': 'Lords, London',
    },
    {
      'teamA': 'Pakistan',
      'teamALogo': 'assets/Images/player.jpg',
      'teamB': 'New Zealand',
      'teamBLogo': 'assets/Images/player.jpg',
      'date': '2024-11-25',
      'time': '15:00',
      'venue': 'Gaddafi Stadium, Lahore',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Cricket Matches'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: matchList.length,
        itemBuilder: (context, index) {
          final match = matchList[index];
          return MatchCard(
            teamA: match['teamA']!,
            teamALogo: match['teamALogo']!,
            teamB: match['teamB']!,
            teamBLogo: match['teamBLogo']!,
            date: match['date']!,
            time: match['time']!,
            venue: match['venue']!,
          );
        },
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final String teamA;
  final String teamALogo;
  final String teamB;
  final String teamBLogo;
  final String date;
  final String time;
  final String venue;

  MatchCard({
    required this.teamA,
    required this.teamALogo,
    required this.teamB,
    required this.teamBLogo,
    required this.date,
    required this.time,
    required this.venue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      color: Colors.blueGrey[50], // Light background color
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Teams with Logos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      teamALogo,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      teamA,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900], // Team A color
                      ),
                    ),
                  ],
                ),
                Text(
                  'VS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      teamB,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900], // Team B color
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      teamBLogo,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Date and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Venue
            Text(
              'Venue: $venue',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.purple, // Venue color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
