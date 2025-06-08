import 'package:dartz/dartz.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/domain/repositories/course_repo.dart';
import 'package:education_app/src/course/domain/use_cases/add_course_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'course_repo_test.dart';



void main() {
  late MockCourseRepository mockCourseRepository;
  late AddCourseUseCase addCourseUseCase;

  setUp(() {
    mockCourseRepository = MockCourseRepository();
    addCourseUseCase = AddCourseUseCase(mockCourseRepository);
  });

  var course = Course.empty();

  test('should call addCourse on the repository', () async {
    // Arrange
    when(() => mockCourseRepository.addCourse(course))
        .thenAnswer((_) async  => const Right(null));

    // Act
    final result = await addCourseUseCase(course);

    // Assert
    expect(result, const Right(null));
    verify(() => mockCourseRepository.addCourse(course)).called(1);
  });
}







