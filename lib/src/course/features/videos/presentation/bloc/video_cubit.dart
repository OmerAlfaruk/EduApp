import 'package:bloc/bloc.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:education_app/src/course/features/videos/domain/usecases/add_video_usecase.dart';
import 'package:education_app/src/course/features/videos/domain/usecases/get_video_usecase.dart';
import 'package:equatable/equatable.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(
      {required AddVideoUseCase addVideoUseCase,
      required GetVideosUseCase getVideosUseCase})
      : _addVideoUseCase = addVideoUseCase,
        _getVideosUseCase = getVideosUseCase,
        super(VideoInitial());
  final AddVideoUseCase _addVideoUseCase;
  final GetVideosUseCase _getVideosUseCase;
  Future<void> addVideo(Video video) async {
    emit(VideoAdding());
    final result = await _addVideoUseCase(video);
    result.fold(
      (failure) => emit(VideoError(failure.message)),
      (_) => emit(VideoAdded()),
    );
  }
  Future<void> getVideos(String courseId) async {
    emit(VideoLoading());
    final result = await _getVideosUseCase(courseId);
    result.fold(
      (failure) => emit(VideoError(failure.message)),
      (videos) => emit(VideoLoaded(videos)),
    );
  }
}
