import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'loginpage.dart';
import 'package:untitled/api_connection/api_connection.dart';
import 'package:untitled/initialPage/model/user.dart';

bool isSignUp=false;


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late TextEditingController _controllerName;
  late TextEditingController _controllerEmail;
  late TextEditingController _controllerPass;
  late TextEditingController _controllerConfirm;

  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController();
    _controllerEmail = TextEditingController();
    _controllerPass = TextEditingController();
    _controllerConfirm = TextEditingController();
  }

  validateUserEmail()async{
    try{
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email':_controllerEmail.text.trim(),
        },
      );
      if(res.statusCode==200){
        var resBodyOfValidateEmail=jsonDecode(res.body);
        if(resBodyOfValidateEmail['emailFound']==true){
          Fluttertoast.showToast(msg: "Email is already in someone else use");
        }
        else{
          registerAndSaveUserRecord();
        }
      }
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  registerAndSaveUserRecord()async{
    User userModel=User(
      1,
      _controllerName.text.trim(),
      _controllerEmail.text.trim(),
      _controllerPass.text.trim()
    );
    try{
     var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson()
      );
     if(res.statusCode==200) {
       var resBodyOfSignup = jsonDecode(res.body);
       if (resBodyOfSignup['success'] == true) {
         Fluttertoast.showToast(msg: "Sign up Success");
       }else{
         Fluttertoast.showToast(msg: "Error, Try again");
       }
     }
     isSignUp = true;
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerPass.dispose();
    _controllerConfirm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.symmetric(horizontal: 32),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(22),
              child: Text(
                "Hello! Register to get started",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(height: 16,),
            InputSection(hintText: 'Username',textEdit: _controllerName,),
            InputSection(hintText: 'Email',textEdit: _controllerEmail,),
            InputSection(hintText: 'Password',textEdit: _controllerPass,),
            InputSection(hintText: 'Confirm Password',textEdit: _controllerConfirm,),
            SizedBox(height: 24,),
            Material(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 22),
                width: double.infinity,
                height: 56,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () async{
                    if(_controllerName.text!=""&&_controllerEmail.text.contains('@')&&_controllerEmail.text.contains('.')&&_controllerPass.text!=""&&_controllerConfirm.text==_controllerPass.text){
                      validateUserEmail();
                      print(isSignUp);
                      if(isSignUp){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CorrectPage())
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 35,),
            Text('Or Register with'),
            SizedBox(height: 22,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonIcon(path: 'assets/images/fb_icon.png'),
                ButtonIcon(path: 'assets/images/g_icon.png'),
                ButtonIcon(path: 'assets/images/a_icon.png'),
              ],
            ),
            SizedBox(height: 54,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login Now',
                    style: TextStyle(
                        color: Colors.cyan
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}

class CorrectPage extends StatelessWidget {
  const CorrectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: 200,
              width: 200,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/Successmark.png'),
            ),
            SizedBox(height: 35,),
            Text(
              'Success!',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 8,),
            Text(
              'Your signup has been completed.',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF8391A1),
              ),
            ),
            Container(
              margin: EdgeInsets.all(32),
              width: 226,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  'Back to Login Page',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}


class InputSection extends StatelessWidget {
  const InputSection({
    Key? key,
    required this.hintText,
    required this.textEdit,
  }) : super(key: key);
  final String hintText;
  final TextEditingController textEdit;

  final Color borderColor = const Color(0xFFF7F8F9);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 6),
      child: TextFormField(
        validator: (val)=>val==""?"Please fill out":null,
        controller: textEdit,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF8391A1)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
          fillColor:borderColor,
          filled: true,
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 56,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFE8ECF4),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: IconButton(
        icon: Image.asset(path),
        iconSize: 26,
        onPressed: (){

        },
      ),
    );
  }
}
