import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@immutable
@JsonSerializable()
class Tasks {
  final String id;
  @JsonKey(name: "assigner_id")
  final String? assignerId;
  @JsonKey(name: "assignee_id")
  final String? assigneeId;
  @JsonKey(name: "project_id")
  final String? projectId;
  @JsonKey(name: "section_id")
  final String? sectionId;
  @JsonKey(name: "content")
  final String? content;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "is_completed")
  final bool? isCompleted;
  @JsonKey(name: "priority")
  final int? priority;
  @JsonKey(name: "comment_count")
  final int commentCount;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "due")
  final dynamic due;

  Tasks(
      {required this.id,
      this.assignerId,
      this.assigneeId,
      required this.projectId,
      required this.sectionId,
      required this.content,
      required this.description,
      required this.isCompleted,
      required this.priority,
      required this.commentCount,
      required this.createdAt,
      required this.due});

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);

  Map<String, dynamic> toJson() => _$TasksToJson(this);

}