import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/Controller/Storage_operation.dart';
import 'package:project2k34/View/LoginPage.dart';
import 'package:project2k34/View/Widgets/myScaffold.dart';
import 'package:project2k34/View/uplode_demo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? selectedRole;
  

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController DepartmentController = TextEditingController();

  XFile? selectedFile;
  StorageOperation storageOperation=StorageOperation();
  // Future<void> uploadeImage({required String fileName}) async {
  //   await FirebaseStorage.instance
  //       .ref()
  //       .child(fileName)
  //       .putFile(File(selectedFile!.path));
  //   print("Success");
  // }

  // Future<String> downloadImgUrl({ required String fileName}) async {
  //   String url =
  //       await FirebaseStorage.instance.ref().child(fileName).getDownloadURL();
  //   return url;
  // }

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
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
                height: 200,
                child:
                    Image.asset("assets/Images/regimg.png", fit: BoxFit.cover
                    )
                    ),
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
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 10,),
                        GestureDetector(

                            onTap: () async {
                              // selectedFile = await _imagePicker.pickImage(
                              //     source: ImageSource.gallery);
                                  
                             selectedFile =await StorageOperation.pickImage();
                              if (selectedFile != null) {
                                log(selectedFile.toString());
                                setState(() {});
                              }
                            },
                            child: (selectedFile == null)
                                ?
                                 Container(
                                  clipBehavior: Clip.antiAlias,
                                    height: 120,
                                    width: 120,
                                    
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                     
                                    
                                      
                                    ),
                                    child: Image.asset(
                                      "assets/Images/player.jpg",
                                      height: 80,
                                      width: 80,
                                      
                                      fit: BoxFit
                                          .fill, // Ensures the image covers the circle completely
                                    ),
                                  )
                              
                                : 
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                    height: 120,
                                    width: 120,
                                    
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                     
                                    
                                      
                                    ),
                                    child: Image.file(File(
                                      selectedFile!.path,
                                      
                                    ),
                                    fit: BoxFit.cover,
                                    ),
                                  )
                               
                                  ),
                        const Text("uplod Image",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                margin: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  "assets/Svg/name.svg",
                                  height: 5,
                                  width: 5,
                                ),
                              ),
                              labelText: "Name",
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
                            controller: mobileController,
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                margin: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  "assets/Svg/phone.svg",
                                  height: 5,
                                  width: 5,
                                ),
                              ),
                              labelText: "Mobile",
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
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Select your Role",
                                style: TextStyle(fontSize: 16),
                              ),
                              DropdownButton<String>(
                                value: selectedRole,
                                hint: const Text("Choose Role"),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                                dropdownColor:
                                    const Color.fromARGB(255, 255, 137, 68),
                                borderRadius: BorderRadius.circular(10),
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: 'Admin',
                                    child: Text('Admin'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Student',
                                    child: Text('Student'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Department',
                                    child: Text('Department'),
                                  ),
                                ],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedRole = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
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
                              hintText: "abc@gmail.com",
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
                            controller: DepartmentController,
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                margin: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  "assets/Svg/dep.svg",
                                  height: 5,
                                  width: 5,
                                ),
                              ),
                              hintText: "slectct your department",
                              labelText: "Department",
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
                            try {
                              if (nameController.text.trim().isNotEmpty &&
                                  mobileController.text.trim().isNotEmpty &&
                                  passwordController.text.trim().isNotEmpty &&
                                  emailController.text.trim().isNotEmpty &&
                                  DepartmentController.text.trim().isNotEmpty &&
                                  selectedRole!.isNotEmpty) {
                                await auth.createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                                // add data to firebase
                                String fileName=selectedFile!.name+ DateTime.now().toString();

                                // await uploadeImage(fileName: fileName);
                                await storageOperation.uploadeImage(fileName: fileName, selectedFile: selectedFile!);
                                // String url=await downloadImgUrl(fileName: fileName);
                                String url=await storageOperation.downloadImgUrl(fileName: fileName);
                                await FirebaseFirestore.instance
                                    .collection(selectedRole!)
                                    .doc(emailController.text)
                                    .set({
                                  'name': nameController.text,
                                  'mobile': mobileController.text,
                                  'email': emailController.text,
                                  'role': selectedRole,
                                  'department': DepartmentController.text,
                                  'imageurl':url,
                                });

                                /// player as department wise
                                if (selectedRole!.toLowerCase() == "student") {
                                  DocumentSnapshot snapshot =
                                      await FirebaseFirestore.instance
                                          .collection("dataDepartment")
                                          .doc(DepartmentController.text)
                                          .get();
                                  if (snapshot.exists) {
                                    await FirebaseFirestore.instance
                                        .collection("dataDepartment")
                                        .doc(DepartmentController.text)
                                        .update({
                                      'students': FieldValue.arrayUnion(
                                          [emailController.text])
                                    });
                                  } else {
                                    await FirebaseFirestore.instance
                                        .collection("dataDepartment")
                                        .doc(DepartmentController.text)
                                        .set({
                                      'students': [emailController.text]
                                    });
                                  }
                                }

                                await MySharedPrefrence.setData(
                                    email: emailController.text,
                                    name: nameController.text,
                                    role: selectedRole!);
                                Myscaffold.showLoginScaffold(context);

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const LoginScreen();
                                    },
                                  ),
                                  (route) => false,
                                );
                              } else {
                                Myscaffold.myNormalScaffold(context,
                                    text: "Please fill all the details ");
                              }
                            } on FirebaseException catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("${e.message}")));
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 300,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            child: const Text(
                              "Registre",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text(
                              "Already Login ? Login",
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
