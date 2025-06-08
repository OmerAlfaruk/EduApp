
import 'package:flutter/material.dart';


class CourseProvider extends ChangeNotifier {
  String? _courseId;

  String? get courseId => _courseId;

  void initCourse(String? courseId) {
    if (_courseId != courseId) {
      _courseId = courseId;
      notifyListeners();
    }
  }

  set courseId(String? courseId) {
    if (_courseId != courseId) {
      _courseId = courseId;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
  void resetCourse() {
    _courseId = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _courseId = null;
    super.dispose();
  }


}