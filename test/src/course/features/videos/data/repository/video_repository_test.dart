import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/src/course/features/videos/data/model/video_model.dart';
import 'package:education_app/src/course/features/videos/data/repository/video_repository_imp.dart';
import 'package:education_app/src/course/features/videos/data/source/video_remote_data_src.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockVideoRemoteDataSource extends Mock implements VideoRemoteDataSource {}

void main() {
  late VideoRemoteDataSource videoRemoteDataSource;
  late VideoRepositoryImp mockVideoRepositoryImp;
  final tVideo = VideoModel.empty();
  const tException = ServerException(
    message: 'Something went wrong',
    statusCode: '500',
  );
  setUp(() {
    videoRemoteDataSource = MockVideoRemoteDataSource();
    mockVideoRepositoryImp = VideoRepositoryImp(videoRemoteDataSource);
    registerFallbackValue(tVideo);
  });

  group('AddVideo', () {
    test(
        'Should complete successfully when call to remote source is successful',
        () async {
      when(
        () => videoRemoteDataSource.addVideo(
          any(),
        ),
      ).thenAnswer((_) async => const Right<Failure,void>(null));

      final result = await mockVideoRepositoryImp.addVideo(tVideo);

      expect(result, const Right<Failure, void>(null));
      verify(() => videoRemoteDataSource.addVideo(tVideo)).called(1);
      verifyNoMoreInteractions(videoRemoteDataSource);
    });

    test(
        "Should Return [ServerFailure] when Call to Remote Data source is unsuccessful",
        () async {
      when(
        () => videoRemoteDataSource.addVideo(
          any(),
        ),
      ).thenThrow(tException);

      final result = await mockVideoRepositoryImp.addVideo(tVideo);

      expect(
          result, Left<Failure, void>(ServerFailure.fromException(tException)));

      verify(
        () => videoRemoteDataSource.addVideo(tVideo),
      ).called(1);
      verifyNoMoreInteractions(videoRemoteDataSource);
    });
  });

  group('GetVideos', () {

    var tVideoModel=VideoModel.empty();
    String tCourseId = tVideoModel.courseId;

    test(
      'should return [List<Video>] when call to remote source is successful',
      () async {
        when(() => videoRemoteDataSource.getVideos(tCourseId)).thenAnswer(
          (_) async => [tVideoModel],
        );

        final result = await mockVideoRepositoryImp.getVideos(tCourseId);


        expect(result, isA<Right<dynamic, List<VideoModel>>>());
        verify(() => videoRemoteDataSource.getVideos(tCourseId)).called(1);
        verifyNoMoreInteractions(videoRemoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is unsuccessful',
      () async {
        when(() => videoRemoteDataSource.getVideos(tCourseId))
            .thenThrow(tException);

        final result = await mockVideoRepositoryImp.getVideos(tCourseId);

        expect(result, Left<Failure, List<VideoModel>>(ServerFailure.fromException(tException)));
        verify(() => videoRemoteDataSource.getVideos(tCourseId)).called(1);
        verifyNoMoreInteractions(videoRemoteDataSource);
      },
    );
  });
  // Additional tests can be added here to verify the behavior of the mock repository
}
