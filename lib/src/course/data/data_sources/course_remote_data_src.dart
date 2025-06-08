import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/src/chat/data/models/group_model.dart';
import 'package:education_app/src/course/data/models/course_model.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class CourseRemoteDataSrc {
  const CourseRemoteDataSrc();
  Future<List<CourseModel>>  getCourses();

  Future<void> addCourse(Course course);
}
class CourseRemoteDataSrcImpl implements CourseRemoteDataSrc {
  const CourseRemoteDataSrcImpl({
    required FirebaseFirestore fireStore,
    required FirebaseStorage storage,
    required FirebaseAuth auth,
  })  : _fireStore = fireStore,
        _storage = storage,
        _auth = auth;

  /// This class would typically interact with a remote API or database
  /// to fetch and manipulate course data.
  final FirebaseFirestore _fireStore;
  final FirebaseStorage _storage;
  final FirebaseAuth _auth;



  @override
  Future<void> addCourse(Course course) async {
    try{

    final user = _auth.currentUser;
    if (user == null) {
      throw const ServerException(message: 'User is Not authenticated', statusCode: '401');
    }


    final courseRef = _fireStore
        .collection('courses')
        .doc();
    final groupRef = _fireStore.collection('groups').doc();

    
    var courseModel= (course as CourseModel).copyWith(
      id: courseRef.id,
      groupId: groupRef.id,
    );


    if(courseModel.imageIsFile){
      try {

        final imageRef = _storage
            .ref()
            .child('courses/${courseModel.id}/profile_image/${courseModel.title}-pfp');

        
        // Check if file exists
        final file = File(courseModel.image!);

        if (!await file.exists()) {
          throw ServerException(
            message: 'Image file does not exist at path: ${courseModel.image}',
            statusCode: '404'
          );
        }

        // Add metadata to the upload
        final metadata = SettableMetadata(
          contentType: 'image/png',
          customMetadata: {'picked-file-path': courseModel.image!},
        );

        // Upload file with metadata
        final uploadTask = await imageRef.putFile(file, metadata);
        
        // Wait for the upload to complete
        await uploadTask;
        
        final url = await imageRef.getDownloadURL();

        courseModel = courseModel.copyWith(image: url);
      } catch (e) {

        if (e is ServerException) rethrow;
        if (e is FirebaseException) {
          throw ServerException(
            message: 'Firebase Storage error: ${e.message}',
            statusCode: e.code
          );
        }
        throw ServerException(
          message: 'Failed to upload image: ${e.toString()}',
          statusCode: '500'
        );
      }
    }


    await courseRef.set(courseModel.toMap());


    final group=GroupModel(id: groupRef.id, name: course.title, courseId:courseRef.id, members: const [],groupImageUrl: courseModel.image);

    await groupRef.set(group.toMap());

    
  }on FirebaseException catch(e){

      throw ServerException(message: e.message??'unknown error occur', statusCode:e.code);
    } on ServerException catch (e) {

      rethrow;
    } catch (e) {

      throw ServerException(message: e.toString(), statusCode: '500');
    }
  }


  @override
  Future<List<CourseModel>> getCourses() async {

    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw const ServerException(message: 'User is Not authenticated', statusCode: '401');
      }

      final querySnapshot = await _fireStore
          .collection('courses')
          .get();

      return querySnapshot.docs
          .map((doc) => CourseModel.fromMap(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw ServerException(message: e.message ?? 'unknown error occur', statusCode: e.code);
    } on ServerException catch (e) {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: '500');
    }
  }



}