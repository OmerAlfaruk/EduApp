import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:education_app/src/course/features/videos/domain/repository/video.dart';
import 'package:equatable/equatable.dart';

class AddVideoUseCase implements UsecaseWithParams<void, Video> {
  final VideoRepository _videoRepository;

  const AddVideoUseCase(this._videoRepository);

  @override
  ResultFuture<void> call(Video params) {
    return _videoRepository.addVideo(params);
  }


}
class AddVideoParams extends Equatable {
  final Video video;

  const AddVideoParams(this.video);

  @override
  String toString() => 'AddVideoParams(video: $video)';

  @override
  List<Object?> get props => [video.id];
}