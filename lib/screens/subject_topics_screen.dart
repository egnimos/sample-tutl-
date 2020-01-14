import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/subject_model.dart';
import '../widgets/subjects_topic_item_list.dart';
// import '../providers/subject_provider.dart';
import '../providers/subject_topics_provider.dart';



class SubjectTopicsScreen extends StatelessWidget {

  static const routeName = '/subject-topics';

  @override
  Widget build(BuildContext context) {

    final courseInfo = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final Color courseColor = courseInfo['color'];
    final String courseTitle = courseInfo['title'];
    final String courseId = courseInfo['id'];

    // final subData = Provider.of<SubjectProvider>(context).halfList.firstWhere((sub) => sub.id == subId);

    final topicsData = Provider.of<SubjectTopicsProvider>(context).topics.where((topic) => topic.subId == courseId ).toList();



    return Scaffold(
      backgroundColor: courseColor,
      body: Column(
        children: <Widget>[

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(11),
            color: Theme.of(context).primaryColor,
          ),

          // Container(
          //   width: double.infinity,
          //   height: 300,
          //   color: Colors.purple,
          // ),

          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Stack(
                children: <Widget>[

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 300,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              courseColor.withOpacity(0.6),
                              courseColor
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(150),
                            bottomLeft: Radius.circular(150),
                          ), 
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 10,
                              offset: Offset(2.0, 3.0),
                              spreadRadius: 3,
                            )
                          ]
                        ),
                        child: Text(
                          courseTitle,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: <Widget>[

                      FittedBox(
                    child: 
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      buildContainerAboutSubjectInfo(courseColor, '29 hours'),
                      buildContainerAboutSubjectInfo(courseColor, '249 topics'),
                      buildContainerAboutSubjectInfo(courseColor, '15 quizes'),
                    ],
                  ),
            ),

            // SizedBox(
            //   height: 270,
            // ),

            SubjectsTopicItemList(
                  topics: topicsData,
                  color: courseColor,
            ),

                    ],
                  ),
                ],
              ),
            ),
          ),

      
          
        ],
      ),
    );
  }

  /*
  method for representing the subject info
  like time, total number of quizes
  and no of topics,
  */

  Container buildContainerAboutSubjectInfo( Color color, text) {
    return Container(
      // color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
                bottom: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: color,
                  style: BorderStyle.solid,
                  width: 2.0,
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
  }
}