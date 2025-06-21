import 'package:dartz/dartz.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:education_app/src/course/features/videos/domain/repository/video.dart';
import 'package:education_app/src/course/features/videos/domain/usecases/add_video_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MocKVideoRepository extends Mock implements VideoRepository {}
void main() {
  late MocKVideoRepository mockVideoRepository;
  late AddVideoUseCase addVideoUseCase;
  var tVideo=Video.empty();
  var tAddVideoParams=AddVideoParams(tVideo);
  setUp(() {
    mockVideoRepository = MocKVideoRepository();
    addVideoUseCase = AddVideoUseCase(mockVideoRepository);
  });

  test('should add video.json successfully', () async {
    // Arrange
    when(() => mockVideoRepository.addVideo(tVideo))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await addVideoUseCase(tVideo);

    // Assert
    expect(
      result,
      equals(const Right(null)),

    );
    verify(() => mockVideoRepository.addVideo(tVideo)).called(1);
  });

  // This is where you would write your tests for the AddVideoUseCase
  // using the MocKVideoRepository to mock the behavior of the VideoRepository.
  // For example:
  //
  // test('should add video.json successfully', () {
  //   final repository = MocKVideoRepository();
  //   final usecase = AddVideoUseCase(repository);
  //
  //   when(() => repository.addVideo(any())).thenAnswer((_) async => Future.value());
  //
  //   final result = usecase(AddVideoParams(video.json: Video(id: '1', title: 'Test Video')));
  //
  //   expect(result, completes);
  // });
}

