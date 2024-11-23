import "package:flutter/material.dart";
Widget depRanking(){
  return Container(
                  height: 50,
                  padding:const EdgeInsets.only(
                    left:10,
                    right:20,
                  ),
                  margin:const EdgeInsets.fromLTRB(25,0, 25, 5),
                  // width: MediaQuery.of(context).size.width,
                  
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15),),
                  ),
                
                  child:Row(children: [
                    Container(
                      width: 40,
                      alignment: Alignment.center,
                
                      child:Stack(
                        children: [
                          Center(child: Image.asset("assets/Images/Gold.png")),
                          const Center(
                            
                            child:Text("1",
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color:Colors.white,
                            ),
                            
                            ),
                            ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Text("Department 1",
                      style: TextStyle(
                        fontSize:20,
                      ),
                    ),
                    const Spacer(),
                    
                   
                    Padding(
                      padding: const EdgeInsets.only(right:5),
                      child: Image.asset("assets/Images/Trophy.png",
                      scale: 7,),
                    ),
                    const Text("125"),
                    // SvgPicture.asset("assets/Silver.svg")
                  ],
                  ),
                );
}