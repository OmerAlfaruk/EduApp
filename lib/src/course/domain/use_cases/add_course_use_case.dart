import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/domain/repositories/course_repo.dart';

class AddCourseUseCase extends UsecaseWithParams<void, Course> {
  const AddCourseUseCase(this._courseRepo);
  final CourseRepo _courseRepo;

  @override
  ResultFuture<void> call(Course course) {
    return _courseRepo.addCourse(course);
  }
}