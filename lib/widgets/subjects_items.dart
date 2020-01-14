import 'package:flutter/material.dart';


import '../screens/subject_info_screen.dart';



class SubjectsItems extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;
  final Color color;

  //construct
  SubjectsItems(
    this.id,
    this.title,
    this.imageUrl,
    this.color,
  );

  void selectedSubject(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      SubjectInfoScreen.routeName,

      arguments: id,

    );
  }
  

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: () => selectedSubject(context),
            child: Column(
              children: <Widget>[

                Container(
                  width: 100,
                  height: 70,
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imageUrl,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(7),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ),
              ],
            ),
  
    );
  }
}