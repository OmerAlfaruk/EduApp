import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String id;
  final String? title;
  final String? thumbnail;
  final String? videoUrl;
  final String? tutor;
  final String courseId;
  final DateTime uploadedDate;
  final bool thumbnailIsFile;

  const Video(
      {required this.id,
      required this.title,
      required this.thumbnail,
      required this.videoUrl,
      required this.tutor,
      required this.courseId,
      required this.uploadedDate,
       this.thumbnailIsFile=false});
  Video.empty()
      : id = 'empty.id',
        title = 'empty.title',
        thumbnail = 'empty.thumbnail',
        videoUrl = 'empty.videoUrl',
        tutor = 'empty.tutor',
        courseId = 'empty.courseId',
        uploadedDate = DateTime.now(),
        thumbnailIsFile = false;


  @override
  List<Object?> get props => [
    id,
    title,
    thumbnail,
    videoUrl,
    tutor,
    courseId,
    uploadedDate,
  ];
}
