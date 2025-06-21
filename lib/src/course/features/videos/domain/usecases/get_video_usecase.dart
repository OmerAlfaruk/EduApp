import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:education_app/src/course/features/videos/domain/repository/video.dart';

class GetVideosUseCase implements UsecaseWithParams<List<Video>,String> {
  final VideoRepository _videosRepository;

  GetVideosUseCase(this._videosRepository);

  @override
  ResultFuture<List<Video>> call(String params) {
    return _videosRepository.getVideos(params);
  }

}