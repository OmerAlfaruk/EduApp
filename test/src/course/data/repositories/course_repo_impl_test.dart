import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/src/course/data/data_sources/course_remote_data_src.dart';
import 'package:education_app/src/course/data/models/course_model.dart';
import 'package:education_app/src/course/data/repositories/course_repo_impl.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSrc extends Mock implements CourseRemoteDataSrc{}

void main(){
  late CourseRemoteDataSrc courseRemoteDataSrc;
  late CourseRepoImpl courseRepoImpl;

  final tCourse=CourseModel.empty();
  const tException = ServerException(
    message: 'Something went wrong',
    statusCode: '500',
  );
  setUp((){
    courseRemoteDataSrc=MockRemoteDataSrc();
    courseRepoImpl=CourseRepoImpl(courseRemoteDataSrc);
    registerFallbackValue(tCourse);
  });

  group('AddCourse', (){
    test('Should complete successfully when call to remote source is successful', ()async{
      when(
              ()=>courseRemoteDataSrc.addCourse(any())
      ).thenAnswer((_)async=>const Right(null),);

      final result=await courseRepoImpl.addCourse(tCourse);

      expect(result, const Right<Failure,void>(null));
      verify(()=>courseRemoteDataSrc.addCourse(tCourse)).called(1);
      verifyNoMoreInteractions(courseRemoteDataSrc);

    });
    
    test("Should Return [ServerFailure] when Call to Remote Data source is unsuccessful", ()async{
      when(()=>courseRemoteDataSrc.addCourse(any())).thenThrow(tException);

      final result=await courseRepoImpl.addCourse(tCourse);

      expect(result, Left<Failure,void>(ServerFailure.fromException(tException)));

      verify(()=>courseRemoteDataSrc.addCourse(tCourse)).called(1);

      verifyNoMoreInteractions(courseRemoteDataSrc);

    });

  });
  group('GetCourses', (){

    test(
      'should return [List<Course>] when call to remote source is successful',
          () async {
        when(() => courseRemoteDataSrc.getCourses()).thenAnswer(
              (_) async => [tCourse],
        );

        final result = await courseRepoImpl.getCourses();

        expect(result, isA<Right<dynamic, List<Course>>>());

        verify(() => courseRemoteDataSrc.getCourses()).called(1);
        verifyNoMoreInteractions(courseRemoteDataSrc);
      },
    );


    test("Should Return [ServerFailure] when Call to Remote Data source is unsuccessful", ()async{

      when(()=>courseRemoteDataSrc.getCourses()).thenThrow(tException);

      final result= await courseRepoImpl.getCourses();

      expect(result, Left<Failure,List<Course>>(ServerFailure.fromException(tException)));
      verify(()=>courseRemoteDataSrc.getCourses()).called(1);
      verifyNoMoreInteractions(courseRemoteDataSrc);



    });
   
  });



}