part of 'video_cubit.dart';

sealed class VideoState extends Equatable {
  const VideoState();
}

final class VideoInitial extends VideoState {
  @override
  List<Object> get props => [];
}

final class VideoLoading extends VideoState {
  @override
  List<Object> get props => [];
}

final class VideoLoaded extends VideoState {
  final List<Video> videos;

  const VideoLoaded(this.videos);

  @override
  List<Object> get props => [videos];
}

final class VideoAdding extends VideoState {
  @override
  List<Object> get props => [];
}

final class VideoAdded extends VideoState {
  @override
  List<Object> get props => [];
}

final class VideoError extends VideoState {
  final String message;

  const VideoError(this.message);

  @override
  List<Object> get props => [message];
}
