import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/screens/subject_topic_content_screen.dart';

import '../providers/subject_topics.dart';



class SubjectsTopicItem extends StatelessWidget {

 
  // final int number;
  final Color color;

  //construct
  SubjectsTopicItem(
 
    // this.number,
    this.color,
  );



  void selectedTopics(BuildContext ctx, id, type) {
     Navigator.of(ctx).pushNamed(

      SubjectTopicContentScreen.routeName,

      arguments: {
        'id' : id,
        'type': type,

      }
    );

    print(id);
  }

  @override
  Widget build(BuildContext context) {

    final topicData = Provider.of<SubjectTopics>(context);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: ListTile(

        onTap: () => selectedTopics(context, topicData.id, topicData.type),

        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            Icons.lock_outline,
            color: Theme.of(context).primaryColor,
          ),
        ),

        title: Text(
          topicData.title,
          style: TextStyle(
            fontSize: 18
          ),
        ),

        subtitle: Text(
          'number of subunits',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),

        trailing: Consumer<SubjectTopics>(
          builder: (ctx, subjectTopics, child) => IconButton(
          icon: Icon(
            subjectTopics.isBookmark ? Icons.bookmark : Icons.bookmark_border,
            color: color,
          ),
          onPressed: () {
            subjectTopics.toggleBookmark();
          },
        ),
        ) ,

      ),
    );
  }
}