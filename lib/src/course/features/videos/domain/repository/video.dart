import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';

abstract class VideoRepository {

  /// Adds a video to the repository.
  ResultFuture<void> addVideo(Video video);

  /// get a video in the repository.
  ResultFuture<List<Video>> getVideos(String courseId);

}