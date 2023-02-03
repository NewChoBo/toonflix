import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello flutter!'),
        ),
        body: Center(
          child: Text('Hello world!'), //클래스 끝날때마다 쉼표 찍으면 오토포매팅때 도와줌
        ),
      ),
    );
  }
}
