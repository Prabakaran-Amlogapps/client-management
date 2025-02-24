import 'package:employee_client_management/models/Attendance.dart';
import 'package:employee_client_management/models/AttendanceStatus.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AttendanceForm extends StatefulWidget {
  final Attendance? attendance;

  const AttendanceForm({Key? key, this.attendance}) : super(key: key);

  @override
  _AttendanceFormState createState() => _AttendanceFormState();
}

class _AttendanceFormState extends State<AttendanceForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _positionController;
  late TextEditingController _noteController;
  late TextEditingController _absentReasonController;
  AttendanceStatus _status = AttendanceStatus.PRESENT;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.attendance?.name ?? '');
    _positionController =
        TextEditingController(text: widget.attendance?.position ?? '');
    _noteController =
        TextEditingController(text: widget.attendance?.note ?? '');
    _absentReasonController =
        TextEditingController(text: widget.attendance?.absentReason ?? '');
    if (widget.attendance != null) {
      _status = widget.attendance!.status;
    }
  }

  Future<void> _saveAttendance() async {
    if (_formKey.currentState!.validate()) {
      try {
        final attendance = Attendance(
          id: widget.attendance?.id,
          name: _nameController.text,
          position: _positionController.text,
          status: _status,
          note: _noteController.text,
          absentReason: _status == AttendanceStatus.ABSENT
              ? _absentReasonController.text
              : null,
          date: TemporalDateTime.now(),
        );

        await Amplify.DataStore.save(attendance);
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving attendance: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.attendance == null ? 'Add Attendance' : 'Edit Attendance'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Card(
              child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        widget.attendance == null
                            ? 'Add Attendance'
                            : 'Edit Attendance',
                        style: TextStyle(
                            fontFamily: "LexendDecaRegular", fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            labelText: 'Name',
                            labelStyle:
                                TextStyle(fontFamily: "LexendDecaRegular"),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _positionController,
                        decoration: const InputDecoration(
                            labelText: 'Position',
                            labelStyle:
                                TextStyle(fontFamily: "LexendDecaRegular"),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.work,
                              color: Colors.blue,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a position';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<AttendanceStatus>(
                        value: _status,
                        decoration: const InputDecoration(
                          labelText: 'Status',
                          labelStyle:
                              TextStyle(fontFamily: "LexendDecaRegular"),
                          border: OutlineInputBorder(),
                        ),
                        items: AttendanceStatus.values.map((status) {
                          return DropdownMenuItem(
                            value: status,
                            child: Text(status.toString().split('.').last),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _status = value!;
                          });
                        },
                      ),
                      if (_status == AttendanceStatus.ABSENT)
                        TextFormField(
                          controller: _absentReasonController,
                          decoration: const InputDecoration(
                              labelText: 'Absent Reason',
                              labelStyle:
                                  TextStyle(fontFamily: "LexendDecaRegular"),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blue,
                              )),
                          validator: (value) {
                            if (_status == AttendanceStatus.ABSENT &&
                                (value == null || value.isEmpty)) {
                              return 'Please enter a reason for absence';
                            }
                            return null;
                          },
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _noteController,
                        decoration: const InputDecoration(
                            labelText: 'Note',
                            labelStyle:
                                TextStyle(fontFamily: "LexendDecaRegular"),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.note_add,
                              color: Colors.blue,
                            )),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: _saveAttendance,
                        child: Text(
                          widget.attendance == null ? 'Add' : 'Update',
                          style: TextStyle(
                              fontFamily: "LexendDecaRegular",
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
