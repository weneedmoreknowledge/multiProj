import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'signuppage.dart';
import 'mainProcess/mainpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
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
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/LOGO.png'),
                width: 100,
                height: 100,
              ),
              Text(
                'System\nIn & Out',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 64,
                ),
              ),
              SizedBox(height: 64,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black),
                  fillColor:Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 16,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black),
                  fillColor:Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 32,),
              SizedBox(
                width: 256,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  child: const Text(
                    'Login up',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              SizedBox(
                width: 256,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
