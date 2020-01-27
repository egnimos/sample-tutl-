import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/joined_courses.dart';

import '../providers/subject_provider.dart';



class SubjectInfoScreen extends StatelessWidget {

  static const routeName = '/subject-info';
  

  @override
  Widget build(BuildContext context) {

    final subId = ModalRoute.of(context).settings.arguments;

    final subData = Provider.of<SubjectProvider>(context, listen: false).findById(subId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children:<Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top:10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                    ),
                  margin: EdgeInsets.only(
                    top: 10
                  ),
                  width: double.infinity,
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  ),
                  child: Image.network(
                    subData.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.medium,
                  ),
                ),

                
              ],
            ),

            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 250,
              color: Colors.black87
            ),

             Positioned(
                top: 150,
                left: 90,
                      child: Container(
                        alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      child: Consumer<Courses>(
                        builder: (_, courses, child) =>  RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: const Text('Join course', style: TextStyle(color: Colors.white ,fontSize: 15),),
                        color: subData.color,
                        hoverColor: subData.color,
                        elevation: 6,
                        hoverElevation: 1,
                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        onPressed: () {
                          courses.addCourses(subData.id, subData.title, subData.imageUrl, subData.color, subData.content, 1);
                          
                        },
                      ),
                      ), 
                     
                    ),
              ),
        

            Padding(
              padding: EdgeInsets.only(
                top:20
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back, 
                      color: Theme.of(context).primaryColor,
                      ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              ),




          
                 Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: EdgeInsets.only(
                    top: 250,
                  ),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70.0),
                  topRight: Radius.circular(70.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    spreadRadius: 2.0,
                    blurRadius: 25.0,
                    offset: Offset(2.0, 2.0)

                  ),
                ] 

                ),

                child: SingleChildScrollView(
                    child: Column(
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '${subData.title}  Programming',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),  
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),


                      FittedBox(
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[

                              buildContainerinfo('24 Hours', subData.color),

                              buildContainerinfo('345 topics', subData.color),

                              buildContainerinfo('24 Quizes', subData.color),
                              
                            ]
                          ),
                      ),

                      Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 5,
                          left: 10
                          ),
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'About:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(
                          top:5,
                          bottom: 5,
                          left: 10,
                          right: 10,
                          ),
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          subData.content,
                           style: TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.w500,
                             color: Colors.grey[700]
                           ),
                        ),
                      )

                    ],
                    
                  ),
                ),
              ),
          

            ],

        ),
      ),
    );
  }

  Container buildContainerinfo(text, color) {
    return Container(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 10,
                            right: 10,
                            ),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                spreadRadius: 1.0,
                                blurRadius: 20.0,
                                offset: Offset(2.0, 2.0),
                              )
                            ]
                          ),
                          child: Text(
                            text,
                            style: TextStyle(
                              color: color,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        );
  }


}