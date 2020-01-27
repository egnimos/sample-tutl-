import 'package:flutter/material.dart';
import '../screens/subject_topics_screen.dart';


class JoinedCoursesItem extends StatelessWidget {
  
  final String courseId;
  final String title;
  final String imageUrl;
  final Color color;

  //construct
  JoinedCoursesItem(
    this.courseId,
    this.title,
    this.imageUrl,
    this.color,
  );

  void selectTopicScreen(BuildContext ctx) {

    Navigator.of(ctx).pushNamed(
      SubjectTopicsScreen.routeName,

      arguments: {
        'id': courseId,
        'color': color,
        'title': title,
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    return  InkWell(
      onTap: () => selectTopicScreen(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: color,
          child: Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover
                ),
              ),

              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
                ),
              ),

              Positioned(
                child: Container(
                  width: double.infinity,
                  height: 150,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 2.0,
                      letterSpacing: 2.0
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
    );
  }
}