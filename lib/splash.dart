import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    //_navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 1500), (){});
    Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'GFG')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100, width: 100, color: Colors.black,),
            Container(
              child: Text('Splash Screen', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
