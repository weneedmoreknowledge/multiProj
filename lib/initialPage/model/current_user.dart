import 'package:get/get.dart';
import 'user.dart';
import 'user_preference.dart';

class CurrentUser extends GetxController{
  Rx<User> _currentUser=User(0, '', '', '','',DateTime(2022,01,01),1).obs;

  User get user=>_currentUser.value;

  getUserInfo()async{
    User? getInfoFromLocal=await RememberUserPrefs.readUserInfo();
    _currentUser.value=getInfoFromLocal!;
  }
}