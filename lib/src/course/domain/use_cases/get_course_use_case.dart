
import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/domain/repositories/course_repo.dart';

class GetCoursesUseCase extends UsecaseWithoutParams<List<Course>>{
  const GetCoursesUseCase(this._courseRepo);
  final CourseRepo _courseRepo;
  @override
  ResultFuture<List<Course>> call() {
    return _courseRepo.getCourses();
  }

}