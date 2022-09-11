import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GeoState _state;

  @override
  void initState() {
    super.initState();

    _state = GeoState.circle();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _state = _state.type == GeoType.circle ? GeoState.rectangle() : GeoState.circle(); 
        });
      },
      child: AnimatedAlign(
        alignment: _state.type == GeoType.circle ? Alignment.bottomRight : Alignment.topCenter,
        duration: const Duration(seconds: 2),
        child: AnimatedContainer(
          margin: const EdgeInsets.all(16.0),
          width: _state.width,
          height: _state.height,
          decoration:  BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(_state.radius),
          ), 
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}

enum GeoType {rectangle, circle, square}

class GeoState {
  final double width;
  final double height;
  final double radius;
  final GeoType type;

  GeoState({required this.width, required this.height, required this.type, required this.radius,});

  factory GeoState.rectangle() {
    return GeoState(width: 150, height: 50, radius: 0, type: GeoType.rectangle);
  }

  factory GeoState.circle() {
    return GeoState(width: 75, height: 75, radius: 100, type: GeoType.circle);
  }

  factory GeoState.square() {
    return GeoState(width: 75, height: 75, radius: 0, type: GeoType.square);
  }
}
