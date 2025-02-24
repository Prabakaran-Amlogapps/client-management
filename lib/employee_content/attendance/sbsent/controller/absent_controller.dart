import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:employee_client_management/models/AttendanceStatus.dart';
import 'package:flutter/material.dart';
import '../../../../models/Attendance.dart';
import 'dart:async';

class AbsentListController {
  DateTime _selectedDate = DateTime.now();
  String _searchQuery = '';
  final _absenteesController = StreamController<List<Attendance>>.broadcast();

  Stream<List<Attendance>> get absenteesStream => _absenteesController.stream;
  DateTime get selectedDate => _selectedDate;

  void loadAbsentees() {
    // Create the start and end of the selected date
    final startOfDay =
        DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
    final endOfDay = DateTime(
        _selectedDate.year, _selectedDate.month, _selectedDate.day, 23, 59, 59);

    Amplify.DataStore.observeQuery(
      Attendance.classType,
      where: Attendance.STATUS.eq(AttendanceStatus.ABSENT).and(Attendance.DATE
          .between(TemporalDateTime(startOfDay), TemporalDateTime(endOfDay))),
    ).listen((event) {
      var absences = event.items.toList();

      // Apply search filter
      if (_searchQuery.isNotEmpty) {
        absences = absences
            .where((attendance) =>
                attendance.name
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()) ||
                attendance.position
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()))
            .toList();
      }

      // Sort by date
      absences.sort((a, b) =>
          b.date.getDateTimeInUtc().compareTo(a.date.getDateTimeInUtc()));

      _absenteesController.add(absences);
    });
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    loadAbsentees();
  }

  void updateSelectedDate(DateTime date) {
    _selectedDate = date;
    loadAbsentees();
  }

  Future<void> updateAbsentReason(
      Attendance attendance, String newReason) async {
    try {
      final updatedAttendance = attendance.copyWith(absentReason: newReason);
      await Amplify.DataStore.save(updatedAttendance);
    } catch (e) {
      print('Error updating absent reason: $e');
      rethrow;
    }
  }

  void dispose() {
    _absenteesController.close();
  }
}

class AttendanceStatusBadge extends StatelessWidget {
  final AttendanceStatus status;

  const AttendanceStatusBadge({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getStatusColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.toString().split('.').last,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (status) {
      case AttendanceStatus.ABSENT:
        return Colors.red;
      case AttendanceStatus.PRESENT:
        return Colors.green;
    }
  }
}
