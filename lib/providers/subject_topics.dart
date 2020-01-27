import 'package:flutter/material.dart';


class SubjectTopics with ChangeNotifier{

  final String id;
  final String subId;
  final String title;
  bool isBookmark;
  
  //construct
  SubjectTopics({
    this.id,
    this.subId,
    this.title,
    this.isBookmark = false,
  });

  void toggleBookmark() {
    isBookmark = !isBookmark;
    notifyListeners();
  }
  
}