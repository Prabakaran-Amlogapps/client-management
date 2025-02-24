import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/foundation.dart';

class Note extends Model {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;
  final TemporalDateTime? createdAt;
  final TemporalDateTime? updatedAt;

  Note({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        description = json['description'] as String?,
        isCompleted = json['isCompleted'] as bool,
        createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isCompleted': isCompleted,
        'createdAt': createdAt?.format(),
        'updatedAt': updatedAt?.format(),
      };

  Note copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    TemporalDateTime? createdAt,
    TemporalDateTime? updatedAt,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Note &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          isCompleted == other.isCompleted;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isCompleted.hashCode;
}
