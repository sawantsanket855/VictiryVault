import "package:flutter/material.dart";

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override 
  State createState()=>_LoginPageState();
}

class _LoginPageState extends State{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body:ListView(
        physics:const NeverScrollableScrollPhysics(),
        children:[
          const SizedBox(height:50),
          const Row(
            children: [
              Spacer(),
              Text("skip"),
              Icon(Icons.keyboard_double_arrow_right),
              SizedBox(width:10),
            ],
          ),
          Container(
            margin:const EdgeInsets.symmetric(vertical: 30),
            height:177,
            width:MediaQuery.of(context).size.width,
            child:ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Image.asset("assets/image.png"),
                Image.asset("assets/image2.png"),
                Image.asset("assets/image3.png"),
              ],
            ),
          ),

          Container(
            margin:const EdgeInsets.symmetric(vertical: 30),
            height:68,
            width:MediaQuery.of(context).size.width,
            child:ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  alignment: Alignment.center,
                  width:253,
                  child: const Column(
                    children: [
                      Text("Efficient Vehicle Services at"),
                      SizedBox(height: 10,),
                      Text("Your Fingertips"),
                    ],
                  )),
                  Container(
                  alignment: Alignment.center,
                  width:253,
                  child: const Column(
                    children: [
                      Text("Simplify, Organize, and "),
                      SizedBox(height: 10,),
                      Text("Manage Your Car Like a Pro"),
                    ],
                  )),
                  Container(
                  alignment: Alignment.center,
                  width:253,
                  child: const Column(
                    children: [
                      Text("Your Car, Our Care: Seamless "),
                      SizedBox(height: 10,),
                      Text("Pickup and Drop Service"),
                    ],
                  )),
              ],
            ),
          ),

          Image.asset("assets/three_dot.png"),
          const SizedBox(height: 40),
          const Text("Login Via",
          style: TextStyle(
            fontFamily:"Poppins",
            fontSize: 30,
            fontWeight:FontWeight.bold,
          ),
          ),

          

          Container(
            margin:const EdgeInsets.only(left:20,right:20,top:30),
            padding:const EdgeInsets.all(0),
            height:39,
            width:329,
            decoration:BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius:const BorderRadius.all(Radius.circular(8)),
              boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 3,
        blurRadius: 7,
        offset:const Offset(0, 3), // changes position of shadow
      ),
    ],
            ),
            child: Row(
              children: [
                Image.asset("assets/ind.png"),
                const Text("  +91",
                  style: TextStyle(
            fontFamily:"Poppins",
            fontSize: 15,
            // fontWeight:FontWeight.bold,
          ),
                ),
                const SizedBox(width: 30,),
                const Expanded(
                  child: SizedBox(
                  //   width:200,
                  // height: 40,
                    child: TextField(
                      textAlignVertical: TextAlignVertical(y:-1),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width:0,
                          ),
                        ),
                      ),
                    
                    ),
                  ),
                ),
          //       const Text("9665709491",
          //          style: TextStyle(
          //   fontFamily:"Poppins",
          //   fontSize: 15,
          //   fontWeight:FontWeight.bold,
          // ),
          //       ),
              ],
            ),
          ),

          Container(
            height: 30,
            decoration:const BoxDecoration(
              color: Colors.red,
              borderRadius:BorderRadius.all(Radius.circular(8)),
            ),
            margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            alignment: Alignment.center,
            child:const Text("GET OTP",
                  style: TextStyle(
                    color:Colors.white,
                  ),
                  ),
          ),

          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/2-20,
                child:const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
              ),
              const Text("or"),
              SizedBox(
              width: MediaQuery.of(context).size.width/2-20,
                child: const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 35,),

          Row(
            children: [
              const SizedBox(width:24),
              Container(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child:Row(
                  children: [
                    Image.asset("assets/wp.png"),
                    const Text("Whatsapp"),
                  ]
                ),
              ),
              const Spacer(),
              Container(
                padding:const EdgeInsets.symmetric(horizontal: 20),

                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child:Row(
                  children: [
                    Image.asset("assets/tg.png"),
                    const Text("Telegram"),
                  ]
                ),
              ),
              const SizedBox(width:24),
            ],
          ),
        ],
      ),
    );
  }
}