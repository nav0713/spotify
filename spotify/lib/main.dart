

import 'package:flutter/material.dart';

void main(){

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),

        useMaterial3: true,
        
      ),
      home: Container(),
    );
  }
}