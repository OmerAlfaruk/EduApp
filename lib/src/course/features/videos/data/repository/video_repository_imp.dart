import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/course/features/videos/data/model/video_model.dart';
import 'package:education_app/src/course/features/videos/data/source/video_remote_data_src.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:education_app/src/course/features/videos/domain/repository/video.dart';

class VideoRepositoryImp implements VideoRepository {
  final VideoRemoteDataSource _videoRemoteDataSource;
  VideoRepositoryImp(this._videoRemoteDataSource);

  @override
  ResultFuture<void> addVideo(Video video) async {
    try{
      await _videoRemoteDataSource.addVideo(video);
      return const Right(null);}
   on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }

  }

  @override
  ResultFuture<List<VideoModel>> getVideos(String courseId) async {
    try {
      final videos =await _videoRemoteDataSource.getVideos(courseId);
      return Right(videos);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

}