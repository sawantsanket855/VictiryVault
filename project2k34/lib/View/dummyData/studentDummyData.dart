
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project2k34/View/point-table/football_pointtable.dart';

class StudentDummyData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to add dummy data for students
  // Future<void> addDummyStudents() async {
  //   List<Map<String, String>> students = [
  //     {
  //       'name': 'Aarav Sharma',
  //       'mobile': '9123456780',
  //       'email': 'aarav.sharma@example.com',
  //       'role': 'Student',
  //       'department': 'CSE', // Computer Science Engineering
  //       'imageurl':
  //           'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg',
  //     },
  //     {
  //       'name': 'Aditya Verma',
  //       'mobile': '9323456782',
  //       'email': 'aditya.verma@example.com',
  //       'role': 'Student',
  //       'department': 'ME', // Mechanical Engineering
  //       'imageurl':
  //           'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg',
  //     },
  //     {
  //       'name': 'Kabir Singh',
  //       'mobile': '9523456784',
  //       'email': 'kabir.singh@example.com',
  //       'role': 'Student',
  //       'department': 'IT', // Information Technology
  //       'imageurl':
  //           'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg',
  //     },
  //     {
  //       'name': 'Rohan Yadav',
  //       'mobile': '9723456786',
  //       'email': 'rohan.yadav@example.com',
  //       'role': 'Student',
  //       'department': 'ECE', // Electronics and Communication Engineering
  //       'imageurl':
  //           'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg',
  //     },
  //     {
  //       'name': 'Arjun Kumar',
  //       'mobile': '9923456788',
  //       'email': 'arjun.kumar@example.com',
  //       'role': 'Student',
  //       'department': 'CIV', // Civil Engineering
  //       'imageurl':
  //           'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg',
  //     },
  //     // Add more boys' data if required...
  //   ];

  //   // Loop to add each student to Firestore
  //   for (var student in students) {
  //     await _firestore.collection('Student').doc(student['email']).set({
  //       'name': student['name'],
  //       'mobile': student['mobile'],
  //       'email': student['email'],
  //       'role': student['role'],
  //       'department': student['department'],
  //       'imageurl': student['imageurl'],
  //     });

  //     DocumentSnapshot snapshot = await _firestore
  //         .collection("dataDepartment")
  //         .doc(student['department'])
  //         .get();

  //     if (snapshot.exists) {
  //       await _firestore
  //           .collection("dataDepartment")
  //           .doc(student['department'])
  //           .update({
  //         'students': FieldValue.arrayUnion([student['email']]),
  //       });
  //     } else {
  //       await _firestore
  //           .collection("dataDepartment")
  //           .doc(student['department'])
  //           .set({
  //         'students': [student['email']],
  //       });
  //     }
  //      // await FirebaseAuth.instance.createUserWithEmailAndPassword( email: student['email']!, password: '12345678');
  //   }

  //   print('Dummy student data (boys only) added!');
  // }



Future<void>cricketpointTable() async{
   await FirebaseFirestore.instance.collection("PointTable").doc("cricketPointTable").set(
    {
      '1':{
        'department':'CSE',
        'p':0,
        'w':0,
        'l':0,
        'nrr':0,
        'points':0
      },
      '2':{
        'department':'IT',
        'p':0,
        'w':0,
        'l':0,
        'nrr':0,
        'points':0
      },
      '3':{
        'department':'CIV',
        'p':0,
        'w':0,
        'l':0,
        'nrr':0,
        'points':0
      },
      '4':{
        'department':'ME',
        'p':0,
        'w':0,
        'l':0,
        'nrr':0,
        'points':0
      },
    

    }
  );


}


Future<void>KabaddipointTable() async{
   await FirebaseFirestore.instance.collection("PointTable").doc("KabaddipointTable").set(
    {
      '1':{
        'department':'CSE',
        'p':0,
        'w':0,
        'l':0,
        'nrr':0,
        'points':0
      },
      '2':{
        'department':'IT',
        'p':0,
        'w':0,
        'l':0,
        'nrr':0,
        'points':0
      },
      '3':{
        'department':'CIV',
        'p':0,
        'w':0,
        'l':0,
        'nrr':0,
        'points':0
      },
      '4':{
        'department':'ME',
        'p':0,
        'w':0,
        'l':0,
        'nrr':0,
        'points':0
      },
    

    }
  );


}


Future<void>FootballPointTable() async{
   await FirebaseFirestore.instance.collection("PointTable").doc("FootballPointTable").set(
    {
      '1':{
        'department':'CSE',
        'p':0,
        'w':0,
        'l':0,
        'd':0,
        'points':0
      },
      '2':{
        'department':'IT',
        'p':0,
        'w':0,
        'l':0,
        'd':0,
        'points':0
      },
      '3':{
        'department':'CIV',
        'p':0,
        'w':0,
        'l':0,
        'd':0,
        'points':0
      },
      '4':{
        'department':'ME',
        'p':0,
        'w':0,
        'l':0,
        'd':0,
        'points':0
      },
    }
  );


}


}

     
     
    

  
