import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/providers/joined_courses.dart';
import 'package:sample/widgets/joined_courses_item.dart';



class JoinedCoursesListScreen extends StatelessWidget {

  static const routeName = '/joined-courses';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
                'My Courses',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).accentColor
                ),
                textScaleFactor: 1.7,
                ),
          
     
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
         
        ),

        
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Consumer<Courses>(
          builder: (context, subject, _) => ListView.builder(
          itemBuilder: (ctx, i) => JoinedCoursesItem(
            subject.courses.values.toList()[i].courseId,
            subject.courses.keys.toList()[i], 
            subject.courses.values.toList()[i].title, 
            subject.courses.values.toList()[i].imageUrl, 
            subject.courses.values.toList()[i].color,
            ),
          itemCount: subject.courseCount,
        ),
        ), 
        
      ),
    );
  }
}