import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

Color? listcolor = Colors.amber.shade50;
String matchID = "lU5WyOrEnTzKJwsi17pC";
Color? containercolor = const Color.fromARGB(255, 29, 54, 88);
Color? buttextcolor = Colors.white;
Color? shadow = Colors.black;
class LiveScore extends StatefulWidget {
  const LiveScore({super.key});
  @override
  State createState()=>_LiveScore();
}


class _LiveScore extends State{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Live",
          style: TextStyle(
             fontSize:30,
             fontWeight: FontWeight.bold,
             ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children:[
              Column(
                children: [
                  Text("Cricket",
                      style: GoogleFonts.sairaStencilOne(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      )),
                  Text(
                    "Round 3 : Match No.12",
                    style: GoogleFonts.pridi(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                margin:const EdgeInsets.all(5),
                padding:const EdgeInsets.all(5),
                color:Colors.white,
                child:const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("First Inning"),
                    Text("Team A",
                     style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    Text("56/5 (3.5)",
                      style:TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    Text("CRR 15.0",
                      style:TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                    ),
          
                  ],),
              ),
              Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                      color: containercolor,
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Batter",
                            style: GoogleFonts.gloock(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: buttextcolor,
                            )),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 35,
                          // color: Colors.red,
                          child: Text("R",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 35,
                          child: Text("B",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 35,
                          // color: Colors.red,
                          child: Text("4",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 35,
                          child: Text("6",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          height: 30,
                          width: 35,
                          child: Text("S/R",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                      ],
                    ),
                  ),
                     Container(
                              margin: const EdgeInsets.symmetric(vertical: 6,horizontal:10),
                              height: 50,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    offset: const Offset(2, 2),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: listcolor,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SizedBox(
                                      height: 44,
                                      width: 33,
                                      child: Image.asset("assets/Images/player.png",
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("player1",
                                        // players[curInning=="inning1"?batsmansKey1[index]:batsmansKey2[index]],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text("47",
                                      // curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["run"]}":"${batsmans2[batsmansKey2[index]]["run"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text("22",
                                      // curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["ball"]}":"${batsmans2[batsmansKey2[index]]["ball"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text("2",
                                      //  curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["four"]}":"${batsmans2[batsmansKey2[index]]["four"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child:const Text("2",
                                      //  curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["six"]}":"${batsmans2[batsmansKey2[index]]["six"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child:const Text("150",
                                      // curInning=="inning1"?((batsmans1[batsmansKey1[index]]["run"])/(batsmans1[batsmansKey1[index]]["ball"])*100).toStringAsFixed(1):((batsmans2[batsmansKey2[index]]["run"])/(batsmans2[batsmansKey2[index]]["ball"])*100).toStringAsFixed(1),
                                      style:TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 6,horizontal:10),
                              height: 50,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    offset: const Offset(2, 2),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: listcolor,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SizedBox(
                                      height: 44,
                                      width: 33,
                                      child: Image.asset("assets/Images/player.png",
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("player1",
                                        // players[curInning=="inning1"?batsmansKey1[index]:batsmansKey2[index]],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text("47",
                                      // curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["run"]}":"${batsmans2[batsmansKey2[index]]["run"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text("22",
                                      // curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["ball"]}":"${batsmans2[batsmansKey2[index]]["ball"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text("2",
                                      //  curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["four"]}":"${batsmans2[batsmansKey2[index]]["four"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child:const Text("2",
                                      //  curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["six"]}":"${batsmans2[batsmansKey2[index]]["six"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child:const Text("150",
                                      // curInning=="inning1"?((batsmans1[batsmansKey1[index]]["run"])/(batsmans1[batsmansKey1[index]]["ball"])*100).toStringAsFixed(1):((batsmans2[batsmansKey2[index]]["run"])/(batsmans2[batsmansKey2[index]]["ball"])*100).toStringAsFixed(1),
                                      style:TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),

          Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                  color: containercolor,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Bowler",
                        style: GoogleFonts.gloock(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: buttextcolor,
                        )),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 30,
                      width: 35,
                      // color: Colors.red,
                      child: Text("O",
                          style: GoogleFonts.gloock(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: buttextcolor,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 30,
                      width: 35,
                      child: Text("M",
                          style: GoogleFonts.gloock(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: buttextcolor,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 30,
                      width: 35,
                      // color: Colors.red,
                      child: Text("R",
                          style: GoogleFonts.gloock(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: buttextcolor,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 30,
                      width: 35,
                      child: Text("W",
                          style: GoogleFonts.gloock(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: buttextcolor,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      height: 30,
                      width: 35,
                      child: Text("Eco",
                          style: GoogleFonts.gloock(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: buttextcolor,
                          )),
                    ),
                  ],
                ),
              ),

              Container(
                              margin: const EdgeInsets.symmetric(vertical: 6,horizontal:10),
                              height: 50,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    offset: const Offset(2, 2),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: listcolor,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SizedBox(
                                      height: 44,
                                      width: 33,
                                      child: Image.asset("assets/Images/player.png",
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("player1",
                                        // players[curInning=="inning1"?batsmansKey1[index]:batsmansKey2[index]],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text("47",
                                      // curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["run"]}":"${batsmans2[batsmansKey2[index]]["run"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text("22",
                                      // curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["ball"]}":"${batsmans2[batsmansKey2[index]]["ball"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child: Text("2",
                                      //  curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["four"]}":"${batsmans2[batsmansKey2[index]]["four"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child:const Text("2",
                                      //  curInning=="inning1"?"${batsmans1[batsmansKey1[index]]["six"]}":"${batsmans2[batsmansKey2[index]]["six"]}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 35,
                                    // color: Colors.red,
                                    child:const Text("150",
                                      // curInning=="inning1"?((batsmans1[batsmansKey1[index]]["run"])/(batsmans1[batsmansKey1[index]]["ball"])*100).toStringAsFixed(1):((batsmans2[batsmansKey2[index]]["run"])/(batsmans2[batsmansKey2[index]]["ball"])*100).toStringAsFixed(1),
                                      style:TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),

                            Container(
                    margin: const EdgeInsets.all(
                      10,
                    ),
                    // height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: containercolor,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:const EdgeInsets.only(left: 15, top: 5),
                          child: Text("Recent Balls",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: listcolor,
                          ),
                          child: Row(
                            children: [Text("sanket",
                              // Text(curInning=="inning1"?didNotPlay1:didNotPlay2,
                                style: GoogleFonts.pridi(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(
                      10,
                    ),
                    // height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: containercolor,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:const EdgeInsets.only(left: 15, top: 5),
                          child: Text("Commentary",
                              style: GoogleFonts.gloock(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: buttextcolor,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: listcolor,
                          ),
                          child: Row(
                            children: [Text("sanket",
                              // Text(curInning=="inning1"?didNotPlay1:didNotPlay2,
                                style: GoogleFonts.pridi(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                    Container(
                      margin:const EdgeInsets.only(top:5),
                      // height: 50,
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue,
                      ),
                      child:Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                
                                const Text("Bowler"),
                                const Spacer(),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("O"),
                                ),
                                
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("M"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("R"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("W"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("Eco"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin:const EdgeInsets.only(bottom:5,left:5,right:5),
                              height: 50,
                              decoration:const BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  color: Colors.white,
                                                ),
                              child: Row(
                                
                                children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: SizedBox(
                                    height: 44,
                                    width: 33,
                                    child:Image.asset("assets/Images/Bumrah.png",fit:BoxFit.cover),
                                  ),
                                ),
                                const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("J Bumrah",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
          
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("3",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("1",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("24",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("2",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right:5),
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 35,
                                  // color: Colors.red,
                                  child: const Text("8.0",
                                  style: TextStyle(
                                    fontSize:13,
                                  ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
          
                              ],
                              ),
                            ),
                        
                        ],
                      ),
                    ),
          
                    Container(
                      margin:const EdgeInsets.only(top:5,bottom:5),
                      padding: const EdgeInsets.symmetric(horizontal:15,vertical:5),
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue,
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text("recent 10 balls"),
                        SizedBox(
                          width:MediaQuery.of(context).size.width,
                          height:35,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            // shrinkWrap: true,
                            // physics:const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context,index){
                              return Container(
                                alignment: Alignment.center,
                                margin:const EdgeInsets.all(3),
                                height:28,
                                width:28,
                                decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:Colors.white,
                                ),
                                child:const Text("0"),
                              );
                            },
                          ),
                        ),
                      ],
                      ),
                    ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Column(
                    children:[
                      Divider(),
                      Row(
                        children: [
                          Text("18.4",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          SizedBox(width:10),
                          Flexible(child: Text("Ravindra to Kohli, no run")),
                        ],
                      ),
                      ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
