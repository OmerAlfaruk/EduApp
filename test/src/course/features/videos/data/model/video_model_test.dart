import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/course/features/videos/data/model/video_model.dart';
import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../../../fixtures/fixture_reader.dart' show fixture;

void main() {
  final timestampData = Timestamp(
    1677483548,
     123456000,
  );
  final date = timestampData.toDate();





  final tVideoModel = VideoModel.empty(uploadedDate: date);

  final tMap = jsonDecode(fixture('video.json')) as DataMap;
  final uploadedDateMap = tMap['uploadedDate'] as Map<String, dynamic>;
  tMap['uploadedDate'] = Timestamp(
    uploadedDateMap['_seconds'],
    uploadedDateMap['_nanoseconds'],
  );

  test('should be a subclass of [Course] entity', () {
    expect(tVideoModel, isA<Video>());
  });

  group('empty', () {
    test('should return a [VideoModel] with empty data', () {
      final result = VideoModel.empty();
      expect(result.title, 'empty.title');
    });
  });


  group('fromMap', () {
    test(
      'should return a [VideoModel] with the correct data',
          () {
        final result = VideoModel.fromMap(tMap);
        expect(result, equals(tVideoModel));
      },
    );
  });
  group('toMap', () {
    test(
      'should return a [Map] with the proper data',
          () async {
        final result = tVideoModel.toMap()
          ..remove('uploadedDate');

        final map = DataMap.from(tMap)
          ..remove('uploadedDate');

        expect(result, equals(map));
      },
    );
  });







}