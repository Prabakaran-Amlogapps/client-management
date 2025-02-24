import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';

enum AttendanceStatus { PRESENT, ABSENT, all }

@immutable
class Attendance extends Model {
  final String id;
  final String name;
  final String position;
  final AttendanceStatus status;
  final String? note;
  final String? absentReason;
  final TemporalDateTime date;

  const Attendance._({
    required this.id,
    required this.name,
    required this.position,
    required this.status,
    this.note,
    this.absentReason,
    required this.date,
  });

  factory Attendance({
    String? id,
    required String name,
    required String position,
    required AttendanceStatus status,
    String? note,
    String? absentReason,
    required TemporalDateTime date,
  }) {
    return Attendance._(
      id: id ?? UUID.getUUID(),
      name: name,
      position: position,
      status: status,
      note: note,
      absentReason: absentReason,
      date: date,
    );
  }
}
