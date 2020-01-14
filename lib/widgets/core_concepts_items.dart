import 'package:flutter/material.dart';


import '../screens/subject_info_screen.dart';


class CoreConceptsItems extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;
  final Color color;


  //construct
  CoreConceptsItems(
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
          child: Container(
        width: 300,
        margin: EdgeInsets.all(10),
        child:Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 280,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 20.0,
                    ),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )

              ],
            ),
          ),
      
      ),
    );
  }
}