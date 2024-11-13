import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget{
  const OtpScreen({super.key});
  @override
  State createState()=>_OtpScreenState();
} 

class _OtpScreenState extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 117,),
              const Text("We have sent a 4 digit OTP on",
          style: TextStyle(
            fontSize:20,
            fontWeight: FontWeight.w500,
          ),
          ),
          const SizedBox(height:15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("+91 0000000000",
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w500,
              ),
              ),
              Padding(
                padding: EdgeInsets.only(left:20,right:70),
                child: Text("EDIT",
                style: TextStyle(
                  fontSize:14,
                  fontWeight: FontWeight.w900,
                ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
            const Text("Enter the OTP before to verify your number",
                style: TextStyle(
                  fontSize:14,
                  fontWeight: FontWeight.w400,
                ),
                ),
                const SizedBox(height: 35,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration:const BoxDecoration(
                          borderRadius:BorderRadius.all(Radius.circular(8))
                        ),
                        child: const TextField(
                          textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical(y:-1),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width:0,
                          ),
                        ),
                      ),
                    
                    ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Container(
                        height: 45,
                        width: 45,
                         decoration:const BoxDecoration(
                          borderRadius:BorderRadius.all(Radius.circular(8))
                        ),
                        child: const TextField(
                          textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical(y:-1),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width:0,
                          ),
                        ),
                      ),
                    
                    ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Container(
                        height: 45,
                        width: 45,
                         decoration:const BoxDecoration(
                          borderRadius:BorderRadius.all(Radius.circular(8))
                        ),
                        child: const TextField(
                          textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical(y:-1),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width:0,
                          ),
                        ),
                      ),
                    
                    ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Container(
                        height: 45,
                        width: 45,
                         decoration:const BoxDecoration(
                          borderRadius:BorderRadius.all(Radius.circular(8))
                        ),
                        child: const TextField(
                          textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical(y:-1),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width:0,
                          ),
                        ),
                      ),
                    
                    ),
                        ),
                    ),
                  ],
                ),
                const SizedBox(height: 25,),
                const Text("Resend OTP in 60s",
                style: TextStyle(
                  fontSize:14,
                  fontWeight: FontWeight.w400,
                ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal:20,vertical:20),
                  height:35,
                  // width:329,
                  decoration:const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromARGB(255, 255, 61, 61),
                  ),
                  child:const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CONTINUE",
                       style: TextStyle(
                        color: Colors.white,
                  fontSize:14,
                  fontWeight: FontWeight.w400,
                ),),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}