import 'package:flutter/material.dart';
import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.symmetric(horizontal: 32),
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
            InputSection(hintText: 'Username'),
            InputSection(hintText: 'Email'),
            InputSection(hintText: 'Password'),
            InputSection(hintText: 'Confirm Password'),
            SizedBox(height: 24,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22),
              width: double.infinity,
              height: 56,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CorrectPage())
                  );
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
  }) : super(key: key);
  final String hintText;

  final Color borderColor = const Color(0xFFF7F8F9);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22,vertical: 6),
      child: TextField(
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
          contentPadding: EdgeInsets.symmetric(horizontal: 18,vertical: 18),
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
