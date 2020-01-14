import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../models/subject_model.dart';
import '../providers/subject_provider.dart';
import '../widgets/subjects_items.dart';
import '../widgets/core_concepts_items.dart';




class SubjectsScreen extends StatefulWidget {

  @override
  _SubjectsScreenState createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {

    final subjects = Provider.of<SubjectProvider>(context).subjects;
    final frameworks = Provider.of<SubjectProvider>(context).frameworks;
    final coreConcepts = Provider.of<SubjectProvider>(context).coreConcepts;

    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          buildContainerHeading('Programming Language'),

          buildContainerListViewBuilder(subjects),

          buildContainerHeading('Frameworks'),

          buildContainerListViewBuilder(frameworks),

          buildContainerHeading('Core Concepts'),

          Container(
            // width: double.infinity,
            height: 250,
            child: 
            ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, i) => CoreConceptsItems(
                coreConcepts[i].id, 
                coreConcepts[i].title,
                coreConcepts[i].imageUrl, 
                coreConcepts[i].color,
                ),
                itemCount: coreConcepts.length,
            ),
          ),



         ],
        
      ),
  
    ); 
  
  }

  /*
  Method to show the 
  listview of the subjects 
  in the given widget given by this method
  by just passing the instance of the provider class as an instance..
  */

  Container buildContainerListViewBuilder(List<SubjectModel> subjects) {
    
    return Container(
          width: double.infinity,
          height: 150,
          padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0,
          ),
          child: ListView.builder(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) => SubjectsItems(
              subjects[i].id,
              subjects[i].title,
              subjects[i].imageUrl,
              subjects[i].color,
            ) ,
            itemCount: subjects.length,
          ),
        );
  }


/*
Method of the Heading,
of the each and every,
heading in the home screen
*/
  Container buildContainerHeading(text) {
    return Container(
          // width: double.infinity,
          margin: EdgeInsets.only(
            top: 10.0,
            bottom: 5.0,
          ),
          padding: EdgeInsets.all(10),
         
            // width: 100,
          //    decoration: BoxDecoration(
          //      borderRadius: BorderRadius.circular(20),
          //   border: Border.all(
          //     color: Colors.teal,
          //     width: 3.0,
          //     style: BorderStyle.solid
          //   )
          // ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.teal[800],
              ),
            ),
       
        );
  }

}//end of the state class.... of stateful widget