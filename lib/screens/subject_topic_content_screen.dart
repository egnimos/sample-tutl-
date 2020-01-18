import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/quiz_content_widget.dart';
import '../providers/subject_topics.dart';
import '../widgets/topic_content_widget.dart';
import '../providers/subject_topics_units_provider.dart';



class SubjectTopicContentScreen extends StatelessWidget {

  
  static const routeName = '/subject-topic-content-screen';

  @override
  Widget build(BuildContext context) {

    final topicData = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final String topicId = topicData['id']; //topic id
    final CourseType topicType = topicData['type']; //topic data
    
    final contentData = Provider.of<SubjectTopicsUnitsProvider>(context, listen: false);

    final content = contentData.units.where((units) => units.topicId == topicId).toList();

    return DefaultTabController(
      length: topicType == CourseType.Topics ? content.length : 1,
      child: Scaffold(
        appBar: AppBar(
          title: topicType == CourseType.Topics ? Text('Tutorial') : Text('Quiz time'),

          
          bottom: topicType == CourseType.Topics ?

        TabBar(
            tabs: content.map((ic) => Tab(icon: Icon(ic.icon),),
            ).toList(),
        ) : 
        TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.play_circle_outline),)
          ],),
        ),

        body: topicType == CourseType.Topics ? 
        
        TabBarView(

          //which widget it will choosse according to the type of the topic

          children: content.map((con) => TopicContentWidget(
            id: con.id,
            title: con.title,
            content:con.content
            )
          ).toList(),
        ) :
        
        TabBarView(
          children: <Widget>[
            QuizContentWidget(),
          ],
        ),
      ),
    );
  }
}