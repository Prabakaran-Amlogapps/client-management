import 'package:employee_client_management/dashboard/calander/calender_wid.dart';
import 'package:employee_client_management/employee_content/report_content/excel_report.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _formKey = GlobalKey<FormState>();

  bool _attendanceChecked = false;
  bool _salaryChecked = false;
  bool _leaveChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Report Generation",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "LexendDecaRegular",
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.date_range,
                                color: Colors.blue,
                              ),
                              Text(
                                "Date Range",
                                style: TextStyle(
                                    fontFamily: "LexendDecaRegular",
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        DatePickerScreen(),
                      ],
                    )),
                const SizedBox(height: 10),
                _buildSectionCard(
                  title: 'Report Types',
                  icon: Icons.description,
                  child: Column(
                    children: [
                      _buildAnimatedCheckboxTile(
                        title: 'Attendance Report',
                        subtitle: 'Employee attendance and timing details',
                        icon: Icons.access_time,
                        value: _attendanceChecked,
                        onChanged: (value) {
                          setState(() => _attendanceChecked = value!);
                        },
                      ),
                      _buildAnimatedCheckboxTile(
                        title: 'Advance',
                        subtitle: 'Employee salary and payment details',
                        icon: Icons.payments,
                        value: _salaryChecked,
                        onChanged: (value) {
                          setState(() => _salaryChecked = value!);
                        },
                      ),
                      _buildAnimatedCheckboxTile(
                        title: 'Employee Details',
                        subtitle: 'Employee leave and time-off details',
                        icon: Icons.person,
                        value: _leaveChecked,
                        onChanged: (value) {
                          setState(() => _leaveChecked = value!);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade700, Colors.blue.shade500],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (!_attendanceChecked &&
                            !_salaryChecked &&
                            !_leaveChecked) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Please select at least one report type',
                                style: TextStyle(
                                  fontFamily: "LexendDecaRegular",
                                ),
                              ),
                              backgroundColor: Colors.red.shade600,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                          return;
                        }
                        // Handle report generation
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Generate Report',
                      style: TextStyle(
                        fontFamily: "LexendDecaRegular",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  child: ExcelReport(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue.shade700, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "LexendDecaRegular",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedCheckboxTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: value
            ? Colors.blue.shade50
            : const Color.fromARGB(255, 247, 249, 250),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: value ? Colors.blue.shade700 : Colors.grey[300]!,
          width: value ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                icon,
                color: value ? Colors.blue.shade700 : Colors.grey[600],
                size: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: "LexendDecaRegular",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: value ? Colors.blue.shade700 : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontFamily: "LexendDecaRegular",
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
