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

  var _isInit = true;
  var _isLoading = false;

  Future<void> _fetchData(BuildContext context) async {
    await Provider.of<SubjectProvider>(context, listen: false).fetchAndSetProducts();
  }


  @override
  void didChangeDependencies() {
    if (_isInit) {

      setState(() {
        _isLoading = true;
      });

      _fetchData(context).then((_) {
        _isLoading = false;
      });
      
    }
    _isInit = false;
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {

    final halfData = Provider.of<SubjectProvider>(context).halfList;

    final subjects = halfData.where((sub) => sub.type == SubjectType.ProgrammingLanguage).toList();
    final frameworks = halfData.where((fra) => fra.type == SubjectType.FrameWork).toList();
    final coreConcepts = halfData.where((fra) => fra.type == SubjectType.CoreConcepts).toList();

    return _isLoading ? Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.purple,
      ),
    ) : SingleChildScrollView(
      child: Column(

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