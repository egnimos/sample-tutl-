import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_topics_provider.dart';
// import '../providers/subject_provider.dart';
import '../widgets/subjects_topic_item_list.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final topicBookmarks = Provider.of<SubjectTopicsProvider>(context).showBookmarks;


    return Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              top: 100,
              bottom: 100,
              right: 20,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2.0, 2.0),
                  spreadRadius: 8.0,
                  blurRadius: 15.0,
                )
              ]

            ),
            child: FittedBox(
              fit: BoxFit.contain,
                child: Text(
                'My Bookmarks',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.tealAccent[700],
                ),
                textScaleFactor: 1.5,
              ),
            ),
          ),

          Column(
            children: <Widget>[
              SubjectsTopicItemList(
                topics: topicBookmarks,
                color: Theme.of(context).accentColor,
              ),
            ],
          ),


        ],
  
    );
  }
}