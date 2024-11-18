import "package:flutter/material.dart";

class ScheduleApp extends StatefulWidget {
  const ScheduleApp({super.key});
  @override
  State createState() => _ScheduleAppState();
}

class _ScheduleAppState extends State {
  int teams = 27;
  List groups = []; // for group data
  int groupCount = 0;
  List checkTeam = []; //for checkboxes
  int curGroup = 0;
  bool selectGroup = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 38, 39),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
          );
        }),
        actions: const [
          Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.login,
            color: Colors.white,
          ),
        ],
        title: const Text(
          "VictoryVault",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 57, 101),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset("assets/Cricket.png")),
              const Text(
                "Cricket",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 45,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: 20,
                          child: Image.asset("assets/battle.png")),
                      const Text("Matches"),
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset("assets/schedule.png",
                            color: Colors.black),
                      ),
                      const Text("Shedule"),
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: 20,
                          child: const Icon(Icons.leaderboard)
                          // child: Image.asset("assets/sports.png"),
                          ),
                      const Text("Leaderboard"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          !selectGroup
              ? Container(
                alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.blue,
                  ),
                  margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Groups",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Text("create atomatic",
                             style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              for (int i = 0; i < teams; i++) {
                                checkTeam.add(false);
                              }
                              selectGroup = true;

                              if (teams < 33 && teams > 8) {
                                groupCount = 4;
                                int rem = teams % 4;
                                for (int i = 0; i < groupCount; i++) {
                                  if (rem > i) {
                                    groups.add(
                                        {"limit": teams ~/ 4 + 1, "teams": []});
                                  } else {
                                    groups.add(
                                        {"limit": teams ~/ 4, "teams": []});
                                  }
                                }
                              } else if (teams < 9 && teams > 4) {
                                groupCount = 2;
                                int rem = teams % 2;
                                for (int i = 0; i < groupCount; i++) {
                                  if (rem > i) {
                                    groups.add(
                                        {"limit": teams ~/ 2 + 1, "teams": []});
                                  } else {
                                    groups.add(
                                        {"limit": teams ~/ 2, "teams": []});
                                  }
                                }
                              }
                              // print(groups);
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Text("create manual",
                               style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.blue,
                  ),
                  margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Schedule",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              color:checkTeam.contains(false)? Colors.grey:Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          Text(
            selectGroup ? "Select Teams" : "Teams",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                selectGroup
                    ? Container(
                        // color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        margin: const EdgeInsets.only(top: 5),
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                curGroup = index;
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                // margin: const EdgeInsets.symmetric(horizontal:2),
                                height: 50,
                                width:
                                    MediaQuery.of(context).size.width / 4 - 10,
                                decoration: BoxDecoration(
                                  color: index == curGroup ? Colors.blue : null,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                ),
                                child:Text(

                                  index==0?"Group A":index==1?"Group B":index==3?"Group C":"Group D",
                                  style:const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox(),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.blue,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "Sr.No",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 50),
                            Text(
                              "Team Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 50),
                            Text(
                              "Department Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 27,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.only(
                                  left: 15, top: 5, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              // height:80,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        selectGroup
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                height: 24,
                                                width: 24,
                                                child: Checkbox(
                                                    activeColor: !groups[
                                                                    curGroup]
                                                                ["teams"]
                                                            .contains(index)
                                                        ? const Color.fromARGB(
                                                            255, 220, 218, 218)
                                                        : null,
                                                    value: checkTeam[index],
                                                    onChanged:
                                                        (bool? newValue) {
                                                      if (checkTeam[index] ==
                                                          true) {
                                                        if (groups[curGroup]
                                                                ["teams"]
                                                            .contains(index)) {
                                                          checkTeam[index] =
                                                              false;
                                                          groups[curGroup]
                                                                  ["teams"]
                                                              .remove(index);
                                                        }
                                                      } else {
                                                        if (groups[curGroup]
                                                                ["limit"] >
                                                            groups[curGroup]
                                                                    ["teams"]
                                                                .length) {
                                                          checkTeam[index] =
                                                              true;
                                                          groups[curGroup]
                                                                  ["teams"]
                                                              .add(index);
                                                          print(groups);
                                                        }
                                                      }

                                                      setState(() {});
                                                    }),
                                              )
                                            : const Text(""),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 30,
                                          child: const Text(
                                            "01",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 140,
                                          child: const Text(
                                            "Team A",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 140,
                                          child: const Text(
                                            "depatment1",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ]),
                            );
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
