import "package:flutter/material.dart";

class ScheduleDiagramApp extends StatefulWidget {
  const ScheduleDiagramApp({super.key});
  @override
  State createState()=>_ScheduleDiagramState();
}

class _ScheduleDiagramState extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading:const Icon(Icons.keyboard_arrow_left_rounded,size: 30,),
        title: const Text("Cricket",
          style:TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:ListView(
        children: [
          Container(
            height:400,
            width:400,
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // color:Colors.grey,
            ),
          
            child:Stack(
              children: [
                Container(
                  height:400,
            width:400,
            clipBehavior: Clip.antiAlias,
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color:Colors.grey,
            ),
                  child: Image.asset("assets/schedule_diagram/team8.png", fit: BoxFit.fill,)),
          
                  Row(
                    children: [
                      const SizedBox(width:5),
                      Column(
                        children: [
                          Container(
                            margin:const EdgeInsets.only(top:4),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Team1"),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:30),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Team2"),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:15),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Team3"),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:30),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Team4"),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:16),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Team5"),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:30),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Team6"),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:16),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Team7"),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:31),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Team8"),
                            ),
                        ],
                      ),
                      const SizedBox(width:41),
          
                      Column(
                        children:[
                          
                           Container(
                            margin:const EdgeInsets.only(top:33),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Winnner1",
                            ),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:73),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Winner2"),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:73),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Winner3"),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:75),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Winner4"),
                            ),
                            ],
                      ),
                      const SizedBox(width: 40,),
          
                      Column(
                        children: [
                          Container(
                            margin:const EdgeInsets.only(top:91),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Winner5"),
                            ),
                            Container(
                            margin:const EdgeInsets.only(top:176),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Winner6"),
                            ),
                        ],
                      ),
                      const SizedBox(width:40),
          
                      Container(
                            margin:const EdgeInsets.only(top:12),
                            height: 28,
                            width:68,
                            alignment: Alignment.center,
                            child:const Text("Winner7"),
                            ),
          
                    ],
                  ),
              ],
            ),
          ),

          const SizedBox(height:40),


          Container(
          height:400,
          width:400,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // color:Colors.grey,
          ),

          child:Stack(
            children: [
              Container(
                height:400,
          width:400,
          clipBehavior: Clip.antiAlias,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color:Colors.grey,
          ),
                child: Image.asset("assets/schedule_diagram/team4.png", fit: BoxFit.fill,)),

                Row(
                  children: [
                    const SizedBox(width:49),
                    Column(
                      children: [
                        Container(
                          margin:const EdgeInsets.only(top:75),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team1"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:41),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team2"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:21),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team3"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:42),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team4"),
                          ),                          
                      ],
                    ),
                    const SizedBox(width:43),

                    Column(
                      children:[
                        
                         Container(
                          margin:const EdgeInsets.only(top:113),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Winnner1",
                          ),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:98),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Winner2"),
                          ),
                          ],
                    ),
                    const SizedBox(width: 43,),

                    Container(
                      margin:const EdgeInsets.only(top:13),
                      height: 35,
                      width:77,
                      alignment: Alignment.center,
                      child:const Text("Winner3"),
                      ),

                  ],
                ),
            ],
          ),
        ),

        const SizedBox(height: 40,),

        Container(
          height:400,
          width:400,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // color:Colors.grey,
          ),

          child:Stack(
            children: [
              Container(
                height:400,
          width:400,
          clipBehavior: Clip.antiAlias,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color:Colors.grey,
          ),
                child: Image.asset("assets/schedule_diagram/team4f.png", fit: BoxFit.fill,)),

                Row(
                  children: [
                    const SizedBox(width:39),
                    Column(
                      children: [
                        Container(
                          margin:const EdgeInsets.only(top:50),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team1"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:47),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team2"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:25),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team3"),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:47),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Team4"),
                          ),                          
                      ],
                    ),
                    const SizedBox(width:44),

                    Column(
                      children:[
                        
                         Container(
                          margin:const EdgeInsets.only(top:91),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Winnner1",
                          ),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:107),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Winner2"),
                          ),
                          ],
                    ),

                  ],
                ),
                
                    Container(
                      margin:const EdgeInsets.only(top:173,left:281),
                      height: 35,
                      width:77,
                      alignment: Alignment.center,
                      child:const Text("Winner3"),
                      ),
            ],
          ),
        ),

        const SizedBox(height: 40,),

        Container(
          height:400,
          width:400,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // color:Colors.grey,
          ),

          child:Stack(
            children: [
              Container(
                height:400,
          width:400,
          clipBehavior: Clip.antiAlias,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color:Colors.grey,
          ),
                child: Image.asset("assets/schedule_diagram/team2f.png", fit: BoxFit.fill,)),

                Row(
                  children: [
                    const SizedBox(width:102),

                    Column(
                      children:[
                        
                         Container(
                          margin:const EdgeInsets.only(top:135),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Winnner1",
                          ),
                          ),
                          Container(
                          margin:const EdgeInsets.only(top:35),
                          height: 35,
                          width:77,
                          alignment: Alignment.center,
                          child:const Text("Winner2"),
                          ),
                          ],
                    ),

                  ],
                ),
                
                    Container(
                      margin:const EdgeInsets.only(top:172,left:226),
                      height: 35,
                      width:77,
                      alignment: Alignment.center,
                      child:const Text("Winner3"),
                      ),
            ],
          ),
        ),

        ],
      ),



    );

  }
}


