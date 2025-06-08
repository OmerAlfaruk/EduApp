

import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/course/data/data_sources/course_remote_data_src.dart';
import 'package:education_app/src/course/data/models/course_model.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/domain/repositories/course_repo.dart';

class CourseRepoImpl implements CourseRepo {
  const CourseRepoImpl(this._courseRemoteDataSrc);
  final CourseRemoteDataSrc _courseRemoteDataSrc;
  @override
  ResultFuture<void> addCourse(Course course) async{
try {
  await _courseRemoteDataSrc.addCourse(course);
  return const Right(null);
}on ServerException catch(e){
  return Left(ServerFailure.fromException(e));
}



  }

  @override
  ResultFuture<List<Course>> getCourses() async {
    try {
      final courses = await _courseRemoteDataSrc.getCourses();
      return Right(courses);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }



  }


}