import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:untitled/initialPage/loginpage.dart';
import 'package:http/http.dart' as http;

import 'package:untitled/initialPage/model/current_user.dart';
import 'package:untitled/initialPage/model/user.dart';
import 'package:untitled/initialPage/signuppage.dart';

import '../../api_connection/api_connection.dart';



bool isChecked = false;
final CurrentUser _rememberCurrentUser=Get.put(CurrentUser());

class Loading extends StatelessWidget {
  Loading({Key? key}) : super(key: key);

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 1),
      ()=>'Complete',
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CurrentUser(),
        initState:(currentState){
          _rememberCurrentUser.getUserInfo();
          },
        builder: (controller){
          return DefaultTextStyle(
            style: Theme.of(context).textTheme.displayMedium!,
            textAlign: TextAlign.center,
            child: FutureBuilder<String>(
              future: _calculation, // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                  Get.to(MainPage());
                } else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ),
                );
              },
            ),
          );
        }
    );
  }
}


class MainPage extends StatefulWidget {
  const MainPage({
    Key? key
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InitialPage(),
      routes: {
        '/qr': (ctx) => const QrPage(),
        '/his':(ctx)=> const HistoryPage(),
        '/feed':(ctx)=> const FeedBackPage(),
        '/pin': (ctx) => const PinPage(),
      },
    );
  }
}

class MyScaffold extends StatelessWidget {
  MyScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CurrentUser(),
        initState:(currentState){
          _rememberCurrentUser.getUserInfo();
        },
        builder: (controller){
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false, // Don't show the leading button
              toolbarHeight: 130,
              backgroundColor:Color(0xFF2A2A37),
              centerTitle: false,
              actions: [
                CircleAvatar(
                  radius: 43,
                  backgroundImage:AssetImage('assets/images/profile.png'),
                ),
                SizedBox(width: 16,)
              ],
              title: Container(
                //padding: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _rememberCurrentUser.user.user_name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(height: 4,),
                        Text(
                          'Member',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: body,
          );
        }
        );
  }
}

// the First page
class InitialPage extends StatelessWidget {
  const InitialPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.symmetric(vertical: 32),
        children: [
          Container(                    //Profile PAGE
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(8,8), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: (){
                Get.to(LoginPage());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 55,
                    height: 55,
                    image: AssetImage('assets/images/profileIcon.png'),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.black,
                        height: 2
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(                    //QR PAGE
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(8,8), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    '/pin'
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 55,
                    height: 55,
                    image: AssetImage('assets/images/qricon.png'),
                  ),
                  Text(
                    'QR code',
                    style: TextStyle(
                        color: Colors.black,
                        height: 2
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(                    //History PAGE
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFFF9900),
              ),
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFFF9900),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(8,8), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFFF9900)),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: (){
                Navigator.pushNamed(context,'/his');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 55,
                    height: 55,
                    image: AssetImage('assets/images/historyIcon.png'),
                  ),
                  Text(
                    'History',
                    style: TextStyle(
                        color: Colors.white,
                        height: 2
                    ),
                  )
                ],
              ),
            ),
          ),
          //Color(0xFFFF9900)
          Container(                    //Feedback PAGE
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(8,8), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: (){
                Navigator.pushNamed(context,'/feed');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 55,
                    height: 55,
                    image: AssetImage('assets/images/feedIcon.png'),
                  ),
                  Text(
                    'Feedbacks',
                    style: TextStyle(
                        color: Colors.black,
                        height: 2
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Display Qr Page
class QrPage extends StatelessWidget {
  const QrPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImage(
              data: _rememberCurrentUser.user.user_email,
              version: QrVersions.auto,
              size: 240.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>InitialPage())
                  );
                },
                child: Text(
                  'Back to main',
                  style: TextStyle(
                    color: Colors.white,
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

//Display User History Page
class HistoryPage extends StatelessWidget {
  const HistoryPage({
    Key? key
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return MyScaffold(
        body:ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length+1,
          itemBuilder: (BuildContext context,int realIndex){
            if(realIndex==0){
             return Container(
               child: Row(
                 children: [
                   IconButton(
                       onPressed: (){
                         Navigator.pop(context);
                       },
                       icon: Icon(Icons.arrow_back_ios)
                   ),
                   Text(
                     'History',
                     style: TextStyle(
                       fontSize: 24,
                       fontWeight: FontWeight.w500
                     ),
                   )
                 ],
               ),
             );
            }
            else {
              int index = realIndex-1;
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            }
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
    );
  }
}

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  late TextEditingController _phoneControl;
  late TextEditingController _feedControl;

  @override
  void initState() {
    // TODO: implement initState
    _phoneControl=TextEditingController();
    _feedControl=TextEditingController();
    super.initState();
  }

  Future submitFeedback()async{
    FeedBack userModel = FeedBack(
      1,
      _rememberCurrentUser.user.user_name,
      _rememberCurrentUser.user.user_email,
      _phoneControl.text.trim(),
      _feedControl.text.trim(),
    );
    try{
      var res = await http.post(
        Uri.parse(API.feedback),
        body: userModel.toJson(),
      );
      if(res.statusCode==200) {
        var resBodyOfSignup = jsonDecode(res.body);
        if (resBodyOfSignup['success'] == true) {
          Fluttertoast.showToast(msg: "Feedback submitted");
          Future.delayed(Duration(seconds: 1), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CorrectPage()),

            );
          });
        }else{
          Fluttertoast.showToast(msg: "Error, Try again");
        }
      }
    }catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MyScaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal:16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)
                    ),
                    Text(
                      'Feedbacks',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 2.5,
                children: [
                  EnterInfoForm(textHint: 'Phone Number',controller: _phoneControl,),
                ],
              ),
              Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        child: Text('Your service rating'),),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  )
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: _feedControl,
                  maxLines: 7,
                  minLines: 7,
                  decoration: InputDecoration(
                    hintText: 'Additional Feedbacks',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                          color: Color(0xFF4A3AFF),
                          width: 2
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Color(0xFFEFF0F6),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  CheckAgree(),
                  Text('I have read and accept the Feedback Policy.'),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: SizedBox(
                  height: 46,
                  width: 256,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      if(isChecked&&_phoneControl.text!=null&&_feedControl.text!=null){
                        submitFeedback();
                      }
                      //Navigator.pop(context);
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  late TextEditingController _pinControl;
  @override
  void initState() {
    // TODO: implement initState
    _pinControl=TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MyScaffold(
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)
              ),
              SizedBox(height: 94,),
              Padding(
                padding: EdgeInsets.all(21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter the PIN',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 32
                      ),
                    ),
                    Text(
                      'I\'ll give you 10 seconds to write it down quickly.',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
              ),
              EnterInfoForm(textHint: 'Enter your PIN',controller: _pinControl,),
              SizedBox(height: 22,),
              Container(
                padding: EdgeInsets.all(8),
                width: 331,
                height: 72,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(
                        context,
                        '/qr'
                    );
                  },
                  child: Text(
                    'Send PIN',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

//Display Correct Page
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
                'Your feedbacks has been sent.',
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
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  child: const Text(
                    'Sign up',
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


class EnterInfoForm extends StatelessWidget {
  const EnterInfoForm({
    required this.textHint,
    required this.controller,
    Key? key
  }) : super(key: key);
  final String textHint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: textHint,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                color: Color(0xFF4A3AFF),
                width: 2
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Color(0xFFEFF0F6),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckAgree extends StatefulWidget {
  const CheckAgree({Key? key}) : super(key: key);

  @override
  State<CheckAgree> createState() => _CheckAgreeState();
}
class _CheckAgreeState extends State<CheckAgree> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (isChecked==true) {
        return Colors.blue;
      }
      return Colors.grey;
    }
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

