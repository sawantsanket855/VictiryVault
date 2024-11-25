import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/View/Widgets/myScaffold.dart';
import 'package:project2k34/View/HomePages/adminHomePage.dart';
import 'package:project2k34/View/admin_home_page.dart';
import 'package:project2k34/View/department_add_screen.dart';
import 'package:project2k34/View/HomePages/department_home_page.dart';
import 'package:project2k34/View/register_Screen.dart';
import 'package:project2k34/View/HomePages/studentHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
   Widget nextScreen(){
   
      if(MySharedPrefrence.myrole=='Admin'){
        log("Inside admin page");
        return  adminHomePage();
      }
      else  if(MySharedPrefrence.myrole=='Department')
      {
        log("Inside department page");
      return  DepartmentHomePage();

      }
      else{
        log("Inside student page");
        return  studentHomeScreen();
      }
  }

  var isOpen = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    log("${MySharedPrefrence.isLogin}");
    log("${MySharedPrefrence.email}");
    log("${MySharedPrefrence.name}");
    log("${MySharedPrefrence.myrole}");
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        decoration: const BoxDecoration(
            // gradient:LinearGradient(
            //   colors: [const Color.fromARGB(248, 235, 235, 235), const Color.fromARGB(208, 196, 214, 235),],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,

            //   ),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 300,
                child: Image.asset("assets/Images/iq.png", fit: BoxFit.cover)),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                margin: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  "assets/Svg/email.svg",
                                  height: 5,
                                  width: 5,
                                ),
                              ),
                              hintText: "Enter your email",
                              labelText: "Email",
                              labelStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight:
                                        Radius.circular(25)), // Green border
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.green, width: 2.0),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(
                                        25)), // Border when focused
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: TextField(
                            controller: passwordController,
                            obscureText: isOpen ? true : false,
                            decoration: InputDecoration(
                              hintText: "12345",
                              labelText: "password",
                              prefixIcon: Container(
                                margin: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  "assets/Svg/password.svg",
                                  height: 5,
                                  width: 5,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  if (isOpen) {
                                    isOpen = false;
                                  } else {
                                    isOpen = true;
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  child: SvgPicture.asset(
                                    isOpen
                                        ? "assets/Svg/hidden.svg"
                                        : "assets/Svg/notHidden.svg",
                                    height: 5,
                                    width: 5,
                                  ),
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                borderSide: BorderSide(
                                    color: Colors.green), // Green border
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                borderSide: BorderSide(
                                    color: Colors.green, // Green border
                                    width: 2.0), // Border when focused
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                         
                          
                            FocusScope.of(context).unfocus();
                            //FocusScope.of(context).unfocus();
                            try {
                              if (emailController.text.trim().isNotEmpty &&
                                  passwordController.text.trim().isNotEmpty) {

                               DocumentSnapshot snapshot1 = await FirebaseFirestore.instance .collection('Student').doc(emailController.text).get(); 
                               DocumentSnapshot snapshot2 = await FirebaseFirestore.instance .collection('Admin').doc(emailController.text).get(); 
                               DocumentSnapshot snapshot3 = await FirebaseFirestore.instance .collection('Department').doc(emailController.text).get(); 
                               if(snapshot1.exists){
                                
                               MySharedPrefrence.setData(email: emailController.text, name: snapshot1['name'] as String, role:snapshot1['role']as String);
                               }
                               else if(snapshot2.exists){
                               MySharedPrefrence.setData(email: emailController.text, name: snapshot2['name'] as String, role:snapshot2['role']as String);


                               }
                               else{
                               MySharedPrefrence.setData(email: emailController.text, name: snapshot3['name'] as String, role:snapshot3['role']as String);

                               }



                               
                            
                           
                                await auth.signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);

                                await MySharedPrefrence.setLoginData(
                                  true,
                                );
                                emailController.clear();
                                passwordController.clear();
                                log("${MySharedPrefrence.isLogin}");
                                Myscaffold.showLoginScaffold(context);
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) {
                                  return nextScreen();
                                }), (Route<dynamic> route) => false);
                              
                              } else {
                                Myscaffold.myNormalScaffold(context,
                                    text:
                                        "Please enter all required information");
                              }
                            } on FirebaseException catch (e) {
                              Myscaffold.myNormalScaffold(context,
                                  text: e.message);
                            }
                          },
                          child: 
                          Container(
                            height: 50,
                            width: 300,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 0, 166, 227),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 243, 240, 240),
                                  fontSize: 20),
                            ),
                          ),
                        ),


                        /// forgot passsword 
                            GestureDetector(
                          onTap: () {
                            showDialog(
  context: context,
  builder: (context) {
    TextEditingController emailController = TextEditingController();

    return AlertDialog(
     
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.white,
      title: const Center(
        child: Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
      
        children: [
          const Text(
            "Please enter your email",
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.grey[100],
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.blueAccent),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
      
      actions: [

        TextButton(
          onPressed: () async {
            try{ 
            if(emailController.text.trim().isNotEmpty){
             
             await auth.sendPasswordResetEmail(email:emailController.text.trim());

             Myscaffold.myNormalScaffold(context, text:"password reset Email is Sent on ${emailController.text}");
              Navigator.pop(context); 

            }
            else{
              Myscaffold.myNormalScaffold(context, text:"Please enter your email");


            }
            }on FirebaseException catch(e){
              Myscaffold.myNormalScaffold(context, text:e.message);
            }
        
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          ),
          child: const Text(
            "Send Link",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        // TextButton(
        //   onPressed: () {
        //     Navigator.pop(context); // Close the dialog
        //   },
        //   style: TextButton.styleFrom(
        //     backgroundColor: Colors.redAccent,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8.0),
        //     ),
        //     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        //   ),
        //   child: Text(
        //     "Cancel",
        //     style: TextStyle(color: Colors.white, fontSize: 16),
        //   ),
        // ),
      ],
    );
  },
);

                            
                      
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        )
                     
                       , GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const RegisterScreen();
                            }));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text(
                              "New User ? Register",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        )
                     
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
