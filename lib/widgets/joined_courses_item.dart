import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/joined_courses.dart';
import '../screens/subject_topics_screen.dart';


class JoinedCoursesItem extends StatelessWidget {
  
  final String courseId;
  final String subjectId;
  final String title;
  final String imageUrl;
  final Color color;

  //construct
  JoinedCoursesItem(
    this.courseId,
    this.subjectId,
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

    return  Dismissible(
      key: ValueKey(courseId),
      background: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          Icons.delete,
          color: Colors.redAccent,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          right: 15,
        ),
        margin: EdgeInsets.all(10),
      ),

      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            // contentPadding: EdgeInsets.all(0),
            // titlePadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            title: Text(
              'Do you want to remove',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              ),

            content: Text(
              'Are you sure you want to remove this course from the joined courses list',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
            ),

            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'No', 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  // fontWeight: FontWeight.w500,
                  ),),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  'Yes', 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  // fontWeight: FontWeight.w500,
                  ),),

              )
            ]
          )
        );
      },

      onDismissed: (direction) {
        Provider.of<Courses>(context, listen:false).removeJoinedCourse(subjectId);
      },
          child: InkWell(
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
      ),
    );
  }
}