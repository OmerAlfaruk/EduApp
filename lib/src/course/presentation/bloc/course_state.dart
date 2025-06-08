part of 'course_cubit.dart';

sealed class CourseState extends Equatable {
  const CourseState();
}

final class CourseInitial extends CourseState {
  @override
  List<Object> get props => [];
}
final class CourseLoading extends CourseState {
  @override
  List<Object> get props => [];
}
final class CourseLoaded extends CourseState {
  final List<Course> courses;

  const CourseLoaded(this.courses);

  @override
  List<Object> get props => [courses];
}


final class CourseError extends CourseState {
  final String message;

  const CourseError(this.message);

  @override
  List<Object> get props => [message];
}
final class AddingCourse extends CourseState {
  @override
  List<Object> get props => [];
}
final class CourseAdded extends CourseState {
  const CourseAdded();

  @override
  List<Object> get props => [];
}
