import 'dart:io';

import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/src/course/data/models/course_model.dart';
import 'package:education_app/src/course/features/videos/data/model/video_model.dart';
import 'package:education_app/src/course/features/videos/data/source/video_remote_data_src.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

void main() {
  late VideoRemoteDataSource remoteDataSource;
  late FakeFirebaseFirestore firestore;
  late MockFirebaseAuth auth;
  late MockFirebaseStorage storage;
  final tVideo = VideoModel.empty().copyWith(thumbnailIsFile: true);

  setUp(() async {
    firestore = FakeFirebaseFirestore();

    final user = MockUser(
      uid: 'uid',
      email: 'email',
      displayName: 'displayName',
    );

    final googleSignIn = MockGoogleSignIn();
    final signInAccount = await googleSignIn.signIn();
    final googleAuth = await signInAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    auth = MockFirebaseAuth(mockUser: user);
    await auth.signInWithCredential(credential);

    storage = MockFirebaseStorage();

    remoteDataSource = VideoRemoteDataSourceImpl(
      fireStore: firestore,
      storage: storage,
      auth: auth,
    );
    await firestore.collection('courses').doc(tVideo.id).set(CourseModel.empty()
        .copyWith(
          id: tVideo.courseId,
        )
        .toMap());
  });
  group('addVideo', () {
    test('should add the provided video to the firestore', () async {
      await remoteDataSource.addVideo(tVideo);
      final firestoreData = await firestore
          .collection('courses')
          .doc(tVideo.courseId)
          .collection('videos')
          .get();
      expect(firestoreData.docs.length, 1);
      final courseRef =
          await firestore.collection('courses').doc(tVideo.courseId).get();

      expect(courseRef.data()!['numberOfVideos'], 1);
    });
    test('should throw ServerException if user is not authenticated', () async {
      final unauthenticatedDataSource = VideoRemoteDataSourceImpl(
        fireStore: firestore,
        storage: storage,
        auth: MockFirebaseAuth(),
      );
      expect(
        () => unauthenticatedDataSource.addVideo(tVideo),
        throwsA(isA<ServerException>()),
      );
    });
    test('should add the provided thumbnail to the storage if its file', ()async{
      final thumbnailFile = File('assets/images/leaderboard_gradient_background.png');
   final video=tVideo.copyWith(thumbnailIsFile: true,thumbnail: thumbnailFile.path);
      await remoteDataSource.addVideo(video);

   final videoCollectionRef=await firestore.collection('courses').doc(video.courseId).collection('videos').get();
      expect(videoCollectionRef.docs.length, 1);
      final videoDoc = videoCollectionRef.docs.first.data();

      final storageRef = storage.ref().child(
          'courses/${tVideo.courseId}/videos/${videoDoc['id']}/thumbnail');
      final downloadUrl = await storageRef.getDownloadURL();
      expect(videoDoc['thumbnail'], equals(downloadUrl));
    });

  });
  group('getVideos', () {
    test('should return a list of videos for the given course', () async {
      await remoteDataSource.addVideo(tVideo);
      final videos = await remoteDataSource.getVideos(tVideo.courseId);
      expect(videos, isA<List<Video>>());
      expect(videos.length, 1);
      expect(videos.first.title, tVideo.title);
    });

    test('should return an empty list if no videos exist for the course', () async {
      final videos = await remoteDataSource.getVideos(tVideo.courseId);
      expect(videos, isEmpty);
    });
  });
  group('getVideos with unauthenticated user', () {
    test('should throw ServerException if user is not authenticated', () async {
      final unauthenticatedDataSource = VideoRemoteDataSourceImpl(
        fireStore: firestore,
        storage: storage,
        auth: MockFirebaseAuth(),
      );
      expect(
        () => unauthenticatedDataSource.getVideos(tVideo.courseId),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
