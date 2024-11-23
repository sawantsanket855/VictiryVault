import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class MySharedPrefrence{
  static String email="default";
  static String name="NoName";
  static String myrole ="Student";
  static bool isLogin=false;
 static  Future<void> setData({required String  email,required String  name, required String role})async {
     SharedPreferences preference=await SharedPreferences.getInstance();
    await preference.setString(
      'email', email,
     );
     await preference.setString(
      'name', name,
     );
     await preference.setString('role',role);
     await getData();
  }
   static  Future<void> setLoginData(logininfo)async {
     SharedPreferences preference=await SharedPreferences.getInstance();
     await preference.setBool('login', logininfo!);
     await getData();
  
  }

   static Future<void> clearData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Clears all data stored in SharedPreferences
    await preferences.clear();
    log("SharedPreferences data cleared.");
    await getData();
  }

  static Future <void> getData()async {
  SharedPreferences preference=await SharedPreferences.getInstance();
  email=preference.getString('email')??"default";
  name=preference.getString('name')??"default";
  myrole=preference.getString('role')??"default";
  isLogin=preference.getBool('login')??false;
}
}

