import 'package:employee_client_management/employee_content/attendance/sbsent/controller/absent_controller.dart';
import 'package:flutter/material.dart';
import '../../../../models/Attendance.dart';

class AbsentListItem extends StatelessWidget {
  final Attendance attendance;
  final VoidCallback onTap;
  final VoidCallback onEdit;

  const AbsentListItem({
    Key? key,
    required this.attendance,
    required this.onTap,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(attendance.name[0].toUpperCase()),
        ),
        title: Text(attendance.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(attendance.position),
            const SizedBox(height: 4),
            Text(
              'Reason: ${attendance.absentReason ?? 'Not provided'}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AttendanceStatusBadge(status: attendance.status),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            ),
          ],
        ),
      ),
    );
  }
}
