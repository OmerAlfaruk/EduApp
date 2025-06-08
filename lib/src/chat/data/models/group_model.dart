import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/chat/domain/entities/group.dart';

class GroupModel extends Group {
  const GroupModel({
    required super.id,
    required super.name,
    required super.courseId,
    required super.members,
    super.lastMessage,
    super.groupImageUrl,
    super.lastMessageTimeStamp,
   super.lastMessageSenderName,
  });

  const GroupModel.empty()
      : this(
          id: '_empty.id',
          name: '_empty.name',
          courseId: '_empty.courseId',
          members: const [],
          lastMessage: null,
          groupImageUrl: null,
          lastMessageTimeStamp: null,
          lastMessageSenderName: '_empty.lastMessageSenderName',
        );

  GroupModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          name: map['name'] as String,
          courseId: map['courseId'] as String,
          members: List<String>.from(map['members'] as List),
          lastMessage: map['lastMessage'] as String?,
          groupImageUrl: map['groupImageUrl'] as String?,
          lastMessageTimeStamp:
              (map['lastMessageTimeStamp'] as Timestamp?)?.toDate(),
          lastMessageSenderName:
              map['lastMessageSenderName'] as String? ,
        );
  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'courseId': courseId,
      'members': members,
      'lastMessage': lastMessage,
      'groupImageUrl': groupImageUrl,
      'lastMessageTimeStamp':
          lastMessageTimeStamp != null ? Timestamp.fromDate(lastMessageTimeStamp!) : null,
      'lastMessageSenderName': lastMessageSenderName,
    };
  }
}