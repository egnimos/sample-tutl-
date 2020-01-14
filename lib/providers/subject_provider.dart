import 'package:flutter/material.dart';

import '../models/subject_model.dart';
import '../dummy/dummy_material_programming_language.dart';


class SubjectProvider with ChangeNotifier {

  List<SubjectModel> _subjects = dummyMaterialSubjectModel;
  List<SubjectModel> _frameworks = dummyMaterialSubjectModelFrameWorks;
  List<SubjectModel> _coreConcepts = dummyMaterialSubjectModelCoreConcepts;

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
    return [..._subjects, ..._frameworks, ...coreConcepts];
  }

  SubjectModel findById(String id) {
    return halfList.firstWhere((sub) => sub.id == id);
  }

  
}