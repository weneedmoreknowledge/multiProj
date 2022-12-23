import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'signuppage.dart';
import 'mainProcess/mainpage.dart';
import 'package:untitled/api_connection/api_connection.dart';
import 'package:untitled/initialPage/model/user.dart';
import 'package:untitled/initialPage/model/user_preference.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController _controllerEmail;
  late TextEditingController _controllerPassword;

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  loginUserNow()async{
    try{
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          'user_email':_controllerEmail.text.trim(),
          'user_password':_controllerPassword.text.trim(),
        },
      );
      if(res.statusCode==200){
        var resBodyOfLogin=jsonDecode(res.body);
        if(resBodyOfLogin['success']==true){
          Fluttertoast.showToast(msg: 'Login Success');
          User userInfo = User.fromJson(resBodyOfLogin['userData']);
          //save user data to local storage
          await RememberUserPrefs.storeUserInfo(userInfo);
          Get.to(()=> Loading());
        }else{
          Fluttertoast.showToast(msg: 'Wrong information. Try again');
        }
      }
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/loginMain.png'),
          colorFilter: ColorFilter.mode(Colors.blueGrey, BlendMode.color),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 64,
                ),
                Image(
                  image: AssetImage('assets/images/LOGO.png'),
                  width: 128,
                  height: 128,
                ),
                SizedBox(height: 32,),
                Text(
                  'Smart Check-in Check out System',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 64,),
                TextFormField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                      hintText: "Enter your email",
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      hintStyle: TextStyle(
                          color: Colors.white
                      ),
                      fillColor:Colors.transparent,
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      )
                  ),
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                      hintText: 'Enter the Password',
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      hintStyle: TextStyle(
                          color: Colors.white
                      ),
                      fillColor:Colors.transparent,
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      )
                  ),
                ),
                SizedBox(height: 32,),
                SizedBox(
                  height: 46,
                  width: 256,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    onPressed: () {
                      loginUserNow();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                SizedBox(
                  height: 46,
                  width: 256,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      Get.to(()=>SignUpPage());
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 64,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                        },
                        child: Text(
                          'Click here',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
