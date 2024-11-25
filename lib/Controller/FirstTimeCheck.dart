import 'package:shared_preferences/shared_preferences.dart';

class Firsttimecheck   {
  static  bool  enterfirsttime=true;
 static  Future<void> setData({required bool isfirsttime}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firsttime',isfirsttime );
    await getData();
  }
 static Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    enterfirsttime = prefs.getBool('firsttime') ?? true;
  }
  

}