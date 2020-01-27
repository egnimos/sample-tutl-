import 'package:flutter/material.dart';


class ResultPageScreen extends StatelessWidget {
  const ResultPageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'This is the result page',
          ),
        ),
      ),
    );
  }
}