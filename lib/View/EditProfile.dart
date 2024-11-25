import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/Controller/Storage_operation.dart';
import 'package:project2k34/View/HomePages/adminHomePage.dart';
import 'package:project2k34/View/HomePages/department_home_page.dart';
import 'package:project2k34/View/HomePages/studentHomePage.dart';
import 'package:project2k34/View/Widgets/My_appbar.dart';
import 'package:project2k34/View/Widgets/myScaffold.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoding = true;

  // final ImagePicker _imagePicker = ImagePicker();
  XFile? selectedFile;
  StorageOperation storageOperation=StorageOperation();

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  Future<void> getData(String collection_name, String emailId) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection(collection_name).doc(emailId).get();
    setState(() {
      nameController.text = snapshot.get('name').toString();
      mobileController.text = snapshot.get('mobile').toString();
      departmentController.text = snapshot.get('department').toString();
      email = snapshot.get('email').toString();
      role = snapshot.get('role').toString();
      url = snapshot.get('imageurl').toString();
    });
  }

  String url = " ";
  Future<void> updatedata(String collection_name, String emailId,String url ) async {
    await FirebaseFirestore.instance.collection(collection_name).doc(emailId).update(
      {
        'name': nameController.text,
        'mobile': mobileController.text,
        'department': departmentController.text,
        'imageurl':url
      },
    );
  }

  String email = ""; // Email to display but not editable
  String role = ""; // Role to display

  @override
  void initState() {
    super.initState();
    getData(MySharedPrefrence.myrole, MySharedPrefrence.email);
    setState(() {
      isLoding = false;
    });
  }

  Future<void> uploadImage(String fileName) async {
    if (selectedFile != null) {
      await FirebaseStorage.instance
          .ref()
          .child(fileName)
          .putFile(File(selectedFile!.path));
      log("Image uploaded successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: isLoding
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.blue))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                          selectedFile = await StorageOperation.pickImage();
                        String fileName=selectedFile!.name+ DateTime.now().toString();
                        if (selectedFile != null) {
                          await storageOperation.uploadeImage(fileName: fileName, selectedFile: selectedFile!);
                          setState(() {});
                        }
                          url=await storageOperation.downloadImgUrl(fileName: fileName);
                         
                      },
                      child: Container(
                      height: 120,
                      width: 120,
                      clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(60)
                        ),

                        child: selectedFile == null?
                        Image.network(url,fit:BoxFit.fill): 
                        Image.file(File(selectedFile!.path),fit:BoxFit.fill),

                        //  CircleAvatar(
                        //   radius: 65,
                        //   backgroundColor: Colors.grey[300],
                        //   backgroundImage: selectedFile != null
                        //       ? FileImage(File(selectedFile!.path))
                        //       : null,
                        //   child: selectedFile == null
                        //       ? Image.network(url,fit: BoxFit.fill,)
                        //       : null,
                        // ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Upload Image", textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "Mobile",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: departmentController,
                      decoration: const InputDecoration(
                        labelText: "Department",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      readOnly: true,
                      controller: TextEditingController(text: email),
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      readOnly: true,
                      controller: TextEditingController(text: role),
                      decoration: const InputDecoration(
                        labelText: "Role",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                      
                        await updatedata(MySharedPrefrence.myrole, MySharedPrefrence.email,url);
                         MySharedPrefrence.name=nameController.text;
                        Myscaffold.myNormalScaffold(context, text: "Profile updated");
                        // Navigator.pop(context);
                        if(MySharedPrefrence.myrole.toLowerCase()=="admin"){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => adminHomePage())
                        );
                        }
                        else if(MySharedPrefrence.myrole.toLowerCase()=='student'){
                            Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => studentHomeScreen())
                        );
                          
                        }
                        else{
                           Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => DepartmentHomePage()
                          )
                          );

                        }
                        setState(() {
                          
                        });
                        
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
