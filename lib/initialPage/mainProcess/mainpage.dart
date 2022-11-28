import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialPage(),
      routes: {
        '/qr': (ctx) => QrPage(),
        '/his':(ctx)=> HistoryPage(),
        '/feed':(ctx)=> FeedBackPage(),
        '/pin': (ctx) => PinPage(),
      },
    );
  }
}

class MyScaffold extends StatelessWidget {
  MyScaffold({required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
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
                    'Name',
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
      body: this.body,
    );
  }
}
// the first page
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
                Navigator.pop(context);
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
                    '/qr'
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
            Image(
              fit: BoxFit.contain,
              height: 332,
              width: double.infinity,
              image: AssetImage('assets/images/qricon.png'),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: (){
                  Navigator.pop(context);
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
//User Feedback Page
class FeedBackPage extends StatelessWidget {
  const FeedBackPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MyScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EnterInfoForm(textHint: 'UserName'),
                EnterInfoForm(textHint: 'Email Address'),
              ],
            ),
            EnterInfoForm(textHint: 'Phone Number'),
            Container(
              child: Text('Hello'),
            ),
            Container(
              child: Text('Hello'),
            ),
          ],
        ),
      ),
    );
  }
}

class EnterInfoForm extends StatelessWidget {
  const EnterInfoForm({
    required this.textHint,
    Key? key
  }) : super(key: key);
  final String textHint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 180,
      child: TextFormField(
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


//Display Pin Enter Page
class PinPage extends StatelessWidget {
  const PinPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
