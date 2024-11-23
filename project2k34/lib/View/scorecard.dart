import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal, // Fresh teal color
          title: const Text(
            "Scorecard",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Column(
                children: [
                  const Text(
                    "Cricket",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const Text(
                    "Round 3 : Match No.12",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(212, 50, 151, 16),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: const [
                              Text(
                                "Team B",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "50/3 (3.4)",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: const [
                              Text(
                                "Team A",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "48/2 (3.2)",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildPlayerStatsHeader(),
                  _buildPlayerStatsList(),
                  const SizedBox(height: 20),
                  _buildDidNotBatSection(),
                  const SizedBox(height: 20),
                  _buildBowlerStatsHeader(),
                  _buildBowlerStatsList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Player Stats Header
  Widget _buildPlayerStatsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Text("Batter", style: TextStyle(color: Colors.white)),
          Spacer(),
          Text("R", style: TextStyle(color: Colors.white)),
          const SizedBox(width: 20),
          Text("B", style: TextStyle(color: Colors.white)),
          const SizedBox(width: 15),
          Text("4", style: TextStyle(color: Colors.white)),
          const SizedBox(width: 8),
          Text("6", style: TextStyle(color: Colors.white)),
          const SizedBox(width: 8),
          Text("S/R", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  // Player Stats List
  Widget _buildPlayerStatsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,
                spreadRadius: 2,
              )
            ],
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/Images/virat.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Virat K",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "b malinga c rahul",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              const Text("44", style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              const Text("22", style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              const Text("4", style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              const Text("2", style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              const Text("200.0", style: TextStyle(fontSize: 14)),
            ],
          ),
        );
      },
    );
  }

  // "Did Not Bat" section
  Widget _buildDidNotBatSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Row(
        children: [
          Text("Did Not Bat:", style: TextStyle(color: Colors.teal)),
          SizedBox(width: 8),
          Text("Rohit, Suresh, Surya, Mohit",
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // Bowler Stats Header
  Widget _buildBowlerStatsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Text("Bowler", style: TextStyle(color: Colors.white)),
          Spacer(),
          Text("O", style: TextStyle(color: Colors.white)),
            const SizedBox(width: 8),
          Text("M", style: TextStyle(color: Colors.white)),
            const SizedBox(width: 8),
          Text("R", style: TextStyle(color: Colors.white)),
            const SizedBox(width: 8),
          Text("W", style: TextStyle(color: Colors.white)),
            const SizedBox(width: 8),
          Text("Eco", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  // Bowler Stats List
  Widget _buildBowlerStatsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/Images/Bumrah.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "J Bumrah",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              const Text("3", style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              const Text("1", style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              const Text("24", style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              const Text("2", style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              const Text("8.0", style: TextStyle(fontSize: 14)),
            ],
          ),
        );
      },
    );
  }
}
