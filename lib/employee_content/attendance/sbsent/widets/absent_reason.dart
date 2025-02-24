import 'package:flutter/material.dart';
import '../../../../models/Attendance.dart';

class AbsentReasonDialog extends StatefulWidget {
  final Attendance attendance;
  final bool isEditing;

  const AbsentReasonDialog({
    Key? key,
    required this.attendance,
    this.isEditing = false,
  }) : super(key: key);

  @override
  State<AbsentReasonDialog> createState() => _AbsentReasonDialogState();
}

class _AbsentReasonDialogState extends State<AbsentReasonDialog> {
  late TextEditingController _reasonController;

  @override
  void initState() {
    super.initState();
    _reasonController =
        TextEditingController(text: widget.attendance.absentReason);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEditing ? 'Edit Absent Reason' : 'Absent Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Employee: ${widget.attendance.name}'),
          Text('Position: ${widget.attendance.position}'),
          const SizedBox(height: 16),
          if (widget.isEditing)
            TextField(
              controller: _reasonController,
              decoration: const InputDecoration(
                labelText: 'Reason for absence',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            )
          else
            Text('Reason: ${widget.attendance.absentReason ?? 'Not provided'}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        if (widget.isEditing)
          ElevatedButton(
            onPressed: () => Navigator.pop(context, _reasonController.text),
            child: const Text('Save'),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }
}
