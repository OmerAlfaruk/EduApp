import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';

class VideoModel extends Video {
  const VideoModel(
      {required super.id,
      required super.title,
      required super.thumbnail,
      required super.videoUrl,
      required super.tutor,
      required super.courseId,
      required super.uploadedDate,
        super.thumbnailIsFile

      });

  /// Creates an empty VideoModel instance with default values.
  VideoModel.empty({DateTime? uploadedDate})
      : super(
    id: 'empty.id',
    title: 'empty.title',
    thumbnail: 'empty.thumbnail',
    videoUrl: 'empty.videoUrl',
    tutor: 'empty.tutor',
    courseId: 'empty.courseId',
    uploadedDate: uploadedDate ?? DateTime.now(),
    thumbnailIsFile: false,
  );


  /// Creates a copy of the VideoModel with optional new values for its properties.
  VideoModel copyWith({
    String? id,
    String? title,
    String? thumbnail,
    String? videoUrl,
    String? tutor,
    String? courseId,
    DateTime? uploadedDate,
    bool ? thumbnailIsFile
  }) {
    return VideoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      videoUrl: videoUrl ?? this.videoUrl,
      tutor: tutor ?? this.tutor,
      courseId: courseId ?? this.courseId,
      uploadedDate: uploadedDate ?? this.uploadedDate,
      thumbnailIsFile: thumbnailIsFile??this.thumbnailIsFile
    );
  }
  /// Factory constructor to create a VideoModel from a DataMap.
  factory VideoModel.fromMap(DataMap data) {
    final uploadedDateRaw = data['uploadedDate'];
    final uploadedDate = uploadedDateRaw is Timestamp
        ? uploadedDateRaw.toDate()
        : DateTime.parse(uploadedDateRaw as String);

    return VideoModel(
      id: data['id'] as String,
      title: data['title'] as String?,
      thumbnail: data['thumbnail'] as String?,
      videoUrl: data['videoUrl'] as String?,
      tutor: data['tutor'] as String?,
      courseId: data['courseId'] as String,
      thumbnailIsFile: data['thumbnailIsFile'],
      uploadedDate: uploadedDate,
    );
  }

  /// Converts the VideoModel instance to a DataMap.
  DataMap toMap() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'videoUrl': videoUrl,
      'tutor': tutor,
      'courseId': courseId,
      'thumbnailIsFile': thumbnailIsFile,
      'uploadedDate': Timestamp.fromDate(uploadedDate), // 🔥 Fixed line
    };
  }

}
