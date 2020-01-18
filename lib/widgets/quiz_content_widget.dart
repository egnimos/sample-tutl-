import 'package:flutter/material.dart';



class QuizContentWidget extends StatelessWidget {
  const QuizContentWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'This is a Quiz Screen',
        ),
      )
    );
  }
}