import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_topics_units_provider.dart';



class SubjectTopicContentScreen extends StatelessWidget {

  
  static const routeName = '/subject-topic-content-screen';

  @override
  Widget build(BuildContext context) {

    final topicId = ModalRoute.of(context).settings.arguments as String;
    
    final contentData = Provider.of<SubjectTopicsUnitsProvider>(context, listen: false);

    final content = contentData.units.where((units) => units.topicId == topicId).toList();

    return DefaultTabController(
      length: content.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tutorial'),
          bottom: TabBar(
            tabs: content.map((ic) => Tab(icon: Icon(ic.icon),),
            ).toList(),

            
          ),
        ),

        body: TabBarView(
          children: content.map((con) => Text(con.content)
          ).toList(),
        ),
      ),
    );
  }
}