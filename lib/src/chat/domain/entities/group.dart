import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final String id;
  final String name;
  final String courseId;
  final List<String> members;
  final String? lastMessage;
  final String? groupImageUrl;
  final DateTime? lastMessageTimeStamp;
  final String? lastMessageSenderName;


  const Group({
    required this.id,
    required this.name,
    required this.courseId,
    required this.members,
    this.lastMessage,
    this.groupImageUrl,
    this.lastMessageTimeStamp,
    this.lastMessageSenderName,

  });

  const Group.empty()
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

  @override
  List<Object?> get props => [id, name, courseId];
}