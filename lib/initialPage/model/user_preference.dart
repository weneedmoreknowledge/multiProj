import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'user.dart';
class RememberUserPrefs{
  static Future<void>storeUserInfo(User userInfo)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String userJsonData=jsonEncode(userInfo.toJson());
    await preferences.setString('currentUser', userJsonData);
  }
  static Future<User?>readUserInfo()async{
    User? currentUserInfo;
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? userInfo=pref.getString("currentUser");
    if(userInfo!=null){
      Map<String,dynamic> userDataMap=jsonDecode(userInfo);
      currentUserInfo=User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }
}