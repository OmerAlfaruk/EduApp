
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:education_app/src/course/features/videos/domain/usecases/add_video_usecase.dart';
import 'package:education_app/src/course/features/videos/domain/usecases/get_video_usecase.dart';
import 'package:education_app/src/course/features/videos/presentation/bloc/video_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetVideosUseCase extends Mock implements GetVideosUseCase {}
class MockAddVideoUseCase extends Mock implements AddVideoUseCase {}

void main(){
  /// This is a test suite for the VideoCubit class, which manages the state of videos in the application.

  late MockGetVideosUseCase mockGetVideosUseCase;
  late MockAddVideoUseCase mockAddVideoUseCase;
  late VideoCubit cubit;
  final tVideo= Video.empty();

  setUp(() {
    mockGetVideosUseCase = MockGetVideosUseCase();
    mockAddVideoUseCase = MockAddVideoUseCase();
    cubit = VideoCubit(
      addVideoUseCase: mockAddVideoUseCase,
      getVideosUseCase: mockGetVideosUseCase,
    );


    registerFallbackValue(tVideo);

  });
  tearDown(() {
    cubit.close();});
test('Initial State should be [VideoInitial]', ()async {
    expect(cubit.state, VideoInitial());
  });

  group('AddVideo', (){
    blocTest<VideoCubit, VideoState>(
      'should emit [VideoAdding,VideoAdded] when successful',
      build: () => cubit,
      act: (cubit) {
        when(() => mockAddVideoUseCase(tVideo)).thenAnswer(
          (_) async => const Right(null),
        );
        return cubit.addVideo(tVideo);
      },
      verify: (cubit) {
        verify(() => mockAddVideoUseCase(tVideo)).called(1);
      },
      expect: () => [
        VideoAdding(),
        VideoAdded(),
      ],
    );

    blocTest<VideoCubit, VideoState>(
      'should emit [VideoAdding,VideoError] when unsuccessful',
      build: () => cubit,
      act: (cubit) {
        when(() => mockAddVideoUseCase(tVideo)).thenAnswer(
          (_) async => Left(ServerFailure(message: 'Error', statusCode: '500')),
        );
        return cubit.addVideo(tVideo);
      },
      verify: (cubit) {
        verify(() => mockAddVideoUseCase(tVideo)).called(1);
      },
      expect: () => [
        VideoAdding(),
        const VideoError('Error'),
      ],
    );
  });

  group('getVideos', () {
    blocTest<VideoCubit, VideoState>(
      'should emit [VideoLoading,VideoLoaded] when successful',
      build: () => cubit,
      act: (cubit) {
        when(() => mockGetVideosUseCase('courseId')).thenAnswer(
          (_) async => Right([tVideo]),
        );
        return cubit.getVideos('courseId');
      },
      verify: (cubit) {
        verify(() => mockGetVideosUseCase('courseId')).called(1);
      },
      expect: () => [
        VideoLoading(),
        VideoLoaded([tVideo]),
      ],
    );

    blocTest<VideoCubit, VideoState>(
      'should emit [VideoLoading,VideoError] when unsuccessful',
      build: () => cubit,
      act: (cubit) {
        when(() => mockGetVideosUseCase('courseId')).thenAnswer(
          (_) async => Left(ServerFailure(message: 'Error', statusCode: '500')),
        );
        return cubit.getVideos('courseId');
      },
      verify: (cubit) {
        verify(() => mockGetVideosUseCase('courseId')).called(1);
      },
      expect: () => [
        VideoLoading(),
        const VideoError('Error'),
      ],
    );
  });
}