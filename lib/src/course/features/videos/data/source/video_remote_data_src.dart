import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/core/utils/data_src_utils.dart';
import 'package:education_app/src/course/features/videos/data/model/video_model.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class VideoRemoteDataSource {
  /// Adds a video to the remote data source.
  Future<void> addVideo(Video video);

  /// Retrieves a list of videos for a given course from the remote data source.
  Future<List<VideoModel>> getVideos(String courseId);
}

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  // This class would implement the actual logic to interact with a remote data source,
 final FirebaseAuth _auth;
 final FirebaseStorage _storage;
 final FirebaseFirestore _fireStore;

  const VideoRemoteDataSourceImpl({
    required FirebaseAuth auth,
    required FirebaseStorage storage,
    required FirebaseFirestore fireStore,
  })  : _auth = auth,
        _storage = storage,
        _fireStore = fireStore;
 @override
 Future<void> addVideo(Video video) async {
   try {
      await DataSourceUtils.authorizeUser(_auth);

     final videoRef = _fireStore.collection('courses').doc(video.courseId).collection('videos').doc();
     var videoModel = (video as VideoModel).copyWith(id: videoRef.id);

     if (videoModel.thumbnailIsFile) {
       final videoFileRef = _storage.ref().child('courses/${videoModel.courseId}/videos/${videoRef.id}/thumbnail');
       final uploadTask = await videoFileRef.putFile(File(videoModel.thumbnail!));
       final downloadUrl = await uploadTask.ref.getDownloadURL();
       videoModel = videoModel.copyWith(thumbnail: downloadUrl);
     }

     await videoRef.set(videoModel.toMap());
     final courseDocRef = _fireStore.collection('courses').doc(videoModel.courseId);
     final courseDoc = await courseDocRef.get();
     if (!courseDoc.exists) {
       await courseDocRef.set({'numberOfVideos': 1});
     } else {
       await courseDocRef.update({
         'numberOfVideos': FieldValue.increment(1),
       });
     }

   } on FirebaseException catch (e) {
     throw ServerException(message: e.message ?? 'Unknown error occurred', statusCode: e.code);
   } on ServerException {
     rethrow;
   } catch (e) {
     throw ServerException(message: 'An unexpected error occurred: ${e.toString()}', statusCode: '500');
   }
 }


  @override
  Future<List<VideoModel>> getVideos(String courseId) async{
    try{
      await DataSourceUtils.authorizeUser(_auth);

      return _fireStore
          .collection('courses')
          .doc(courseId)
          .collection('videos')
          .get()
          .then((snapshot) => snapshot.docs
              .map((doc) => VideoModel.fromMap(doc.data()))
              .toList());
    }on FirebaseException catch (e) {
      throw ServerException(message: e.message ?? 'Unknown error occurred', statusCode: e.code);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'An unexpected error occurred: ${e.toString()}', statusCode: '500');
    }
  }
}