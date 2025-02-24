import 'package:employee_client_management/employee_content/attendance/sbsent/widets/absent_list_item.dart';
import 'package:employee_client_management/employee_content/attendance/sbsent/widets/absent_reason.dart';
import 'package:flutter/material.dart';
import '../controller/absent_controller.dart';
import '../../../../models/Attendance.dart';
import 'package:intl/intl.dart';

class AbsentListScreen extends StatefulWidget {
  const AbsentListScreen({Key? key}) : super(key: key);

  @override
  State<AbsentListScreen> createState() => _AbsentListScreenState();
}

class _AbsentListScreenState extends State<AbsentListScreen> {
  late AbsentListController _controller;
  final TextEditingController _searchController = TextEditingController();
  bool _showCalendar = false;

  @override
  void initState() {
    super.initState();
    _controller = AbsentListController();
    _controller.loadAbsentees();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Absent Employees'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => setState(() => _showCalendar = !_showCalendar),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or position...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _controller.updateSearchQuery('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: (value) => _controller.updateSearchQuery(value),
            ),
          ),

          // Date Display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: ${DateFormat('MMM dd, yyyy').format(_controller.selectedDate)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _controller.updateSelectedDate(DateTime.now());
                  },
                  child: const Text('Today'),
                ),
              ],
            ),
          ),

          // Calendar (Expandable)
          if (_showCalendar)
            Card(
              margin: const EdgeInsets.all(16.0),
              child: CalendarDatePicker(
                initialDate: _controller.selectedDate,
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
                onDateChanged: (date) {
                  _controller.updateSelectedDate(date);
                  setState(() => _showCalendar = false);
                },
              ),
            ),

          // Attendance List
          Expanded(
            child: StreamBuilder<List<Attendance>>(
              stream: _controller.absenteesStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final absences = snapshot.data ?? [];

                if (absences.isEmpty) {
                  return const Center(
                    child: Text('No absent employees found'),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: absences.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final absence = absences[index];
                    return AbsentListItem(
                      attendance: absence,
                      onTap: () => _showAbsentDetails(context, absence),
                      onEdit: () => _showEditDialog(context, absence),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAbsentDetails(BuildContext context, Attendance attendance) {
    showDialog(
      context: context,
      builder: (context) => AbsentReasonDialog(attendance: attendance),
    );
  }

  Future<void> _showEditDialog(
      BuildContext context, Attendance attendance) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AbsentReasonDialog(
        attendance: attendance,
        isEditing: true,
      ),
    );

    if (result != null) {
      await _controller.updateAbsentReason(attendance, result);
    }
  }
}
