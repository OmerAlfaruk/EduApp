

import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/domain/repositories/course_repo.dart';
import 'package:education_app/src/course/domain/use_cases/get_course_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'course_repo_test.dart';

void main() {
  late CourseRepo repo;
  late GetCoursesUseCase usecase;

  setUp(() {
    repo = MockCourseRepository();
    usecase = GetCoursesUseCase(repo);
  });

  test('should get courses from the repo', () async {
    // arrange
    when(() => repo.getCourses()).thenAnswer((_) async => const Right([]));
    // act
    final result = await usecase();
    // assert
    expect(result, const Right<dynamic, List<Course>>([]));
    verify(() => repo.getCourses()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
