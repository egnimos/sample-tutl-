import 'package:flutter/material.dart';

class SubjectModel {

  final String id;
  // final String streamId;
  final String title;
  final String imageUrl;
  final Color color;
  final String content;

  //construct
  SubjectModel({
   @required this.id,
   @required this.title,
   @required this.imageUrl,
   @required this.color,
   @required this.content,
  });
  
}