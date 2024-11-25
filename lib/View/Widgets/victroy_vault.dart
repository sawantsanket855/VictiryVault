import "package:flutter/material.dart";
import "package:project2k34/View/dep_ranking.dart";
import "package:project2k34/View/match_card.dart";

class VictoryVault extends StatefulWidget {
  const VictoryVault({super.key});
  @override
  State createState() => _VictoryVaultState();
}

class _VictoryVaultState extends State {
  bool deptMinCount = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for a clean look

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Cricket Button
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue.shade50, // Light blue background for freshness
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/Images/Cricket.png"),
                      const Text("Cricket", style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
                // Football Button
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green.shade50, // Light green background
                  ),
                  child: Row(
                    children: [
                      SizedBox(child: Image.asset("assets/Images/football.png")),
                      const Text("Football", style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ),
                // Kabaddi Button
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.orange.shade50, // Light orange background
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/Images/sports.png"),
                      ),
                      const Text("Kabaddi", style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          Expanded(
            child: ListView(
              children: [
                // Leaderboard Section
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue.shade100, // Soft blue container for leaderboard
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: Center(
                          child: SizedBox(
                            height: 100,
                            width: 200,
                            child: Stack(
                              children: [
                                Image.asset("assets/Images/label_style.png"),
                                const Padding(
                                  padding: EdgeInsets.only(top: 40, left: 20),
                                  child: Text(
                                    "Leaderboard",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: deptMinCount ? 5 : 10,
                        itemBuilder: (context, index) {
                          return depRanking();
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            deptMinCount = !deptMinCount;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              deptMinCount ? "Show more" : "Show less",
                              style: const TextStyle(color: Colors.white),
                            ),
                            Icon(
                              deptMinCount
                                  ? Icons.keyboard_arrow_down_rounded
                                  : Icons.keyboard_arrow_up_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                
                // Live Matches Section
                const Text(
                  "Live Matches",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return matchCardLive(context);
                    },
                  ),
                ),

                const SizedBox(height: 35),

                // Upcoming Matches Section
                const Text(
                  "Upcoming Matches",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return matchCardUpcoming();
                    },
                  ),
                ),

                const SizedBox(height: 35),

                // Completed Matches Section
                const Text(
                  "Completed Matches",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return matchCardCompleted(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}