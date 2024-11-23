import "package:flutter/material.dart";
import "package:flutter_application_1/victory_vault.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:firebase_core/firebase_core.dart";
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:const FirebaseOptions(apiKey: "AIzaSyBqC9rE-6RV1GP-LaFAAjn_nqQKKNLQ7-w", appId: "1:992087814619:android:9cb13170e4a6e9f27df7fe", messagingSenderId: "992087814619", projectId: "victoryvault-71490"));
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("myrole","Admin");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: VictoryVault(),
    );
  }
}