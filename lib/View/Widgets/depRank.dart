import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';

class DepartmentRankingWithPhotos extends StatefulWidget {
  final bool isappbar;
  DepartmentRankingWithPhotos({super.key, required bool this.isappbar});
  @override
  _DepartmentRankingWithPhotosState createState() =>
      _DepartmentRankingWithPhotosState();
}

class _DepartmentRankingWithPhotosState
    extends State<DepartmentRankingWithPhotos> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // List to store the department rankings
  List<Map<String, dynamic>> rankings = [];

  @override
  void initState() {
    super.initState();
    fetchDepartmentRankings();
  }

  // Fetch department rankings from Firestore
  Future<void> fetchDepartmentRankings() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('dataDepartment').get();

      // Map Firestore documents to the rankings list
      final List<Map<String, dynamic>> fetchedRankings = snapshot.docs.map(
        (doc) {
          final data = doc.data() as Map<String, dynamic>;
          return {
            "department": doc.id, // Use document ID as department name
            "points": data["rankingpoints"] ?? 0,
            "photoUrl":
                data["footballlogo"] ?? "", // Use empty string if no photo
          };
        },
      ).toList();

      // Sort rankings by points in descending order
      fetchedRankings.sort((a, b) => b["points"].compareTo(a["points"]));

      setState(() {
        rankings = fetchedRankings;
      });
    } catch (e) {
      print("Error fetching rankings: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.isappbar ? MyAppBar() : null,
      body: Column(
        children: [
          widget.isappbar
              ? Container(
                  decoration: BoxDecoration(),
                  height: 150,
                  child: Image.asset("assets/Images/rankingimg.png"))
              : SizedBox(
                  height: 5,
                ),
          Text(
            "Department Rankings",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 134, 59, 255)),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 250, 251),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: rankings.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator()) // Loading spinner
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      itemCount: rankings.length,
                      itemBuilder: (context, index) {
                        final ranking = rankings[index];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          child: Container(
                            height: 80, // Reduced card height
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF80D8FF), // Light Blue
                                  Color.fromARGB(
                                      255, 238, 187, 229), // Soft Pink
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Row(
                                children: [
                                  // Department Photo (Circular Avatar)
                                  CircleAvatar(
                                    radius: 28, // Reduced size
                                    backgroundColor: Colors.grey[200],
                                    backgroundImage: ranking["photoUrl"] != ""
                                        ? NetworkImage(ranking["photoUrl"])
                                        : null,
                                    child: ranking["photoUrl"] == ""
                                        ? const Icon(
                                            Icons.image_not_supported,
                                            size: 28, // Reduced icon size
                                            color: Colors.blue,
                                          )
                                        : null,
                                  ),
                                  const SizedBox(width: 16),
                                  // Department Name and Points
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          ranking['department'],
                                          style: const TextStyle(
                                            fontSize: 16, // Reduced font size
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 72, 78, 255),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "${ranking['points']} Points",
                                          style: const TextStyle(
                                            fontSize: 14, // Reduced font size
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Rank Badge
                                  Container(
                                    width: 30, // Reduced size
                                    height: 30, // Reduced size
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          blurRadius: 6,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "#${index + 1}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14, // Reduced font size
                                          color: Color(0xFF0077B6),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}