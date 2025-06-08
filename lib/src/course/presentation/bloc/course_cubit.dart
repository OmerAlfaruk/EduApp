import 'package:bloc/bloc.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/domain/use_cases/add_course_use_case.dart';
import 'package:education_app/src/course/domain/use_cases/get_course_use_case.dart';
import 'package:equatable/equatable.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit(
      {required AddCourseUseCase addCourseUseCase,
      required GetCoursesUseCase getCoursesUseCase})
      : _addCourseUseCase = addCourseUseCase,
        _getCoursesUseCase = getCoursesUseCase,
        super(CourseInitial());

  final AddCourseUseCase _addCourseUseCase;
  final GetCoursesUseCase _getCoursesUseCase;

  Future<void> addCourse(Course course) async {
    emit(AddingCourse());
    final result = await _addCourseUseCase(course);
    result.fold(
      (failure) => emit(CourseError(failure.errorMessage)),
      (_) => emit(const CourseAdded()),
    );
  }

  Future<void> getCourses() async {
    emit(CourseLoading());

    final result = await _getCoursesUseCase();
    result.fold((failure) => emit(CourseError(failure.errorMessage)),
        (courses) => emit(CourseLoaded(courses)));
  }
}
