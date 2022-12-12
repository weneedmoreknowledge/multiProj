import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/initialPage/loginpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        builder: (context,dataSnapShot){
          return const LoginPage();
        },
      )
    );
  }
}