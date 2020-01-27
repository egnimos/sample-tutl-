import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_topics.dart';

import './subjects_topic_item.dart';
// import '../providers/subject_topics_provider.dart';
// import '../providers/subject_topics.dart';


class SubjectsTopicItemList extends StatefulWidget {

  final List<SubjectTopics> topics;
  final Color color;

  //construct

  // SubjectsTopicItemList(
    
  // );


  SubjectsTopicItemList(
    {Key key,
    @required this.topics,
    @required this.color,
    }) : super(key: key);

  @override
  _SubjectsTopicItemListState createState() => _SubjectsTopicItemListState();
}

class _SubjectsTopicItemListState extends State<SubjectsTopicItemList> {

  ScrollController _controller = ScrollController();


  @override
  Widget build(BuildContext context) {

    

    return Expanded(
      child: ListView.builder(
        controller: _controller,
        physics: BouncingScrollPhysics(),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: widget.topics[i],
          child: SubjectsTopicItem(
            // i+1,
            widget.color,
            
          ),
        ),
        itemCount: widget.topics.length,
      ),
    );
  }
}