import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animationController..addStatusListener((status) {
      if (status == AnimationStatus.completed) _animationController.forward(from: 0);
    });

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            width: 180,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),

              gradient: SweepGradient(
                startAngle: 4,
                colors: [Colors.yellow, Colors.indigo],
                transform: GradientRotation(_animationController.value * 3),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(9.0),
              child: Container(
                color: Colors.yellow,
                alignment: Alignment.center,
                child: Text(
                  "Button",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
