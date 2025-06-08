import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/domain/use_cases/add_course_use_case.dart';
import 'package:education_app/src/course/domain/use_cases/get_course_use_case.dart';
import 'package:education_app/src/course/presentation/bloc/course_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockAddCourseUseCase extends Mock implements AddCourseUseCase {}

class MockGetCoursesUseCase extends Mock implements GetCoursesUseCase {}

void main() {
  /// This is a test suite for the CourseCubit class, which manages the state of courses in the application.

  late MockAddCourseUseCase mockAddCourseUseCase;
  late MockGetCoursesUseCase mockGetCoursesUseCase;
  late CourseCubit cubit;

  var tFailure = ServerFailure(
    message: 'Error',
    statusCode: '500',
  );

  setUp(() {
    mockAddCourseUseCase = MockAddCourseUseCase();
    mockGetCoursesUseCase = MockGetCoursesUseCase();
    cubit = CourseCubit(
      addCourseUseCase: mockAddCourseUseCase,
      getCoursesUseCase: mockGetCoursesUseCase,
    );
  });
  test('initial state should be CourseInitial', () {
    expect(cubit.state, CourseInitial());
  });

  group('AddCourse', () {
    final tCourse = Course.empty();
    blocTest<CourseCubit, CourseState>(
      'should emit [AddingCourse,CourseAdded] when successful',
      build: () => cubit,
      act: (cubit) {
        when(() => mockAddCourseUseCase(tCourse)).thenAnswer(
          (_) async => const Right(null),
        );
        return cubit.addCourse(tCourse);
      },
      verify: (cubit) {
        verify(() => mockAddCourseUseCase(tCourse)).called(1);
      },
      expect: () => [
        AddingCourse(),
        const CourseAdded(),
      ],
    );
    blocTest<CourseCubit, CourseState>(
        'should emit[CourseLoading,CourseError] when unsuccessful',
        build: () => cubit,
        act: (cubit) {
          when(() => mockAddCourseUseCase(tCourse)).thenAnswer(
            (_) async => Left(tFailure),
          );
          return cubit.addCourse(tCourse);
        },
        expect: () => [
          AddingCourse(),
              CourseError(tFailure.errorMessage),
            ]);
  });

  group('getCourses', () {
    blocTest<CourseCubit, CourseState>(
      'should emit [CourseLoading,CourseLoaded] when successful',
      build: () {
        when(() => mockGetCoursesUseCase()).thenAnswer(
          (_) async => Right([Course.empty()]),
        );
        return cubit;
      },
      act: (cubit) => cubit.getCourses(),
      verify: (cubit) {
        verify(() => mockGetCoursesUseCase()).called(1);
      },
      expect: () => [
        CourseLoading(),
        CourseLoaded([Course.empty()]),
      ],
    );
    blocTest<CourseCubit, CourseState>(
      'should emit [CourseLoading,CourseError] when unsuccessful',
      build: () {
        when(() => mockGetCoursesUseCase()).thenAnswer(
          (_) async => Left(tFailure),
        );
        return cubit;
      },
      act: (cubit) => cubit.getCourses(),
      expect: () => [
        CourseLoading(),
        CourseError(tFailure.errorMessage),
      ],
    );
  });
}
