import 'package:dartz/dartz.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:education_app/src/course/features/videos/domain/repository/video.dart';
import 'package:education_app/src/course/features/videos/domain/usecases/get_video_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockVideoRepository extends Mock implements VideoRepository {}

void main() {
  late MockVideoRepository mockVideoRepository;
  late GetVideosUseCase getVideosUseCase;
 var tVideo= Video.empty();


  setUp(() {

    mockVideoRepository = MockVideoRepository();
    getVideosUseCase = GetVideosUseCase(mockVideoRepository);
  });

  test('should return call [repo.getVideos]', () {
    // arrange
    when(() => mockVideoRepository.getVideos(any()))
        .thenAnswer((_) async => Right(<Video>[tVideo]));
    // act
    final result = getVideosUseCase(tVideo.courseId);
    // assert
    expect(result, isA<ResultFuture<List<Video>>>());



  });

  // Additional tests can be added here to verify the behavior of the mock repository
}