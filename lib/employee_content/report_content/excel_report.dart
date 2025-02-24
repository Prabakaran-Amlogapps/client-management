import 'package:flutter/material.dart';

class ExcelStyleTable extends StatelessWidget {
  final List<String> headers;
  final List<List<String>> data;

  const ExcelStyleTable({
    super.key,
    required this.headers,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      // margin: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Row
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  children: headers
                      .map((header) => _buildCell(
                            header,
                            isHeader: true,
                          ))
                      .toList(),
                ),
              ),
              // Data Rows
              ...data.map((row) => Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: Row(
                      children: row.map((cell) => _buildCell(cell)).toList(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCell(String text, {bool isHeader = false}) {
    return Container(
      constraints: const BoxConstraints(minWidth: 120),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "LexendDecaRegular",
          fontSize: 11.3,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? Colors.black87 : Colors.black54,
        ),
      ),
    );
  }
}

// Example implementation of ExcelReport widget
class ExcelReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data - replace with your actual data
    final headers = [
      'Employee Id',
      'Name',
      'Department',
      'Date',
      'Status',
      'Hours',
    ];

    final data = [
      ['EMP001', 'John Doe', 'IT', '01/01/2024', 'Present', '8'],
      ['EMP002', 'John Doe', 'HR', '01/01/2024', 'Present', '7.5'],
      ['EMP003', 'John Doe', 'Sales', '01/01/2024', 'Absent', '0'],
      ['EMP004', 'John Doe', 'IT', '01/01/2024', 'Present', '8'],
      ['EMP005', 'John Doe', 'Marketing', '01/01/2024', 'Present', '8'],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                'Report Details',
                style: TextStyle(
                  fontFamily: "LexendDecaRegular",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.print,
                    color: Colors.grey,
                  ),
                  label: Text(
                    "Print",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.blue,
                  ),
                  label: Text(
                    "Share",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        ExcelStyleTable(
          headers: headers,
          data: data,
        ),
      ],
    );
  }
}
