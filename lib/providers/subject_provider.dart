import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/subject_model.dart';
//import '../dummy/dummy_material_programming_language.dart';


class SubjectProvider with ChangeNotifier {

  List<SubjectModel> _subjects = [];
  List<SubjectModel> _frameworks = [];
  List<SubjectModel> _coreConcepts = [];

  List<SubjectModel> _halfList = [];

  List<SubjectModel> get subjects {
    return [..._subjects];
  }

  List<SubjectModel> get frameworks {
    return [..._frameworks];
  }

  List<SubjectModel> get coreConcepts {
    return [..._coreConcepts];
  }

  List<SubjectModel> get halfList {
    return [..._halfList];
  }

  SubjectModel findById(String id) {
    return halfList.firstWhere((sub) => sub.id == id);
  }


  
  //fecth data from the database
  Future<void> fetchAndSetProducts() async {

    // final filterString = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';

    const url = 'https://tutlify-admin-panel.firebaseio.com/courses.json';

    try {

      final response = await http.get(url);
      
      print(json.decode(response.body));
      
      // final List<SubjectModel> loadedData = [];

      // SubjectType type;

      // extractedData.forEach((courseId, courseData) {

      //   if (courseData['type'] == 'Programming Language') {
      //      type = SubjectType.ProgrammingLanguage;
      //   }else if (courseData['type'] == 'Framework') {
      //      type = SubjectType.FrameWork;
      //   }else if(courseData['type'] == 'CoreConcept') {
      //      type = SubjectType.CoreConcepts;
      //   }else {
      //      print('...');
      //   }

      //   Color colorType = Color(int.parse(['color'].toString()));

      //   loadedData.add(
      //     SubjectModel(
      //       id: courseId,
      //       title: courseData['title'],
      //       imageUrl: courseData['imageUrl'],
      //       content: courseData['content'],
      //       type: type,
      //       color: colorType,
      //     ));
      // });

      // _halfList = loadedData;

      // notifyListeners();

    } catch (error) {

      print(error);

      throw (error);

    }
  }

  
}