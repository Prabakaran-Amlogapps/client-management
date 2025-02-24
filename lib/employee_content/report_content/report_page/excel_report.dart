import 'package:flutter/material.dart';

class ExcelReportContainer extends StatefulWidget {
  final String title;
  final List<String> headers;
  final List<List<dynamic>> data;
  final bool showRowNumbers;
  final bool showTotalRow;

  const ExcelReportContainer({
    Key? key,
    required this.title,
    required this.headers,
    required this.data,
    this.showRowNumbers = true,
    this.showTotalRow = true,
  }) : super(key: key);

  @override
  State<ExcelReportContainer> createState() => _ExcelReportContainerState();
}

class _ExcelReportContainerState extends State<ExcelReportContainer> {
  ScrollController _horizontalScrollController = ScrollController();
  ScrollController _verticalScrollController = ScrollController();

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          _buildToolbar(),
          Expanded(child: _buildExcelSheet()),
          if (widget.showTotalRow) _buildTotalRow(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontFamily: "LexendDecaRegular",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Row(
            children: [
              _buildIconButton(
                icon: Icons.file_download,
                tooltip: 'Export',
                onPressed: () {
                  // Implement export functionality
                },
              ),
              _buildIconButton(
                icon: Icons.print,
                tooltip: 'Print',
                onPressed: () {
                  // Implement print functionality
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          _buildToolbarButton(
            icon: Icons.search,
            label: 'Search',
          ),
          const SizedBox(width: 8),
          _buildToolbarButton(
            icon: Icons.filter_list,
            label: 'Filter',
          ),
          const SizedBox(width: 8),
          _buildToolbarButton(
            icon: Icons.sort,
            label: 'Sort',
          ),
        ],
      ),
    );
  }

  Widget _buildExcelSheet() {
    return Scrollbar(
      controller: _verticalScrollController,
      thumbVisibility: true,
      child: Scrollbar(
        controller: _horizontalScrollController,
        thumbVisibility: true,
        notificationPredicate: (notification) => notification.depth == 1,
        child: SingleChildScrollView(
          controller: _horizontalScrollController,
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            controller: _verticalScrollController,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.grey.shade50),
              dataRowColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.blue.withOpacity(0.08);
                  }
                  return null;
                },
              ),
              columns: _buildColumns(),
              rows: _buildRows(),
              columnSpacing: 56,
              headingRowHeight: 56,
              dataRowHeight: 52,
              showCheckboxColumn: true,
              dividerThickness: 1,
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    List<DataColumn> columns = [];

    if (widget.showRowNumbers) {
      columns.add(const DataColumn(
        label: Text(
          '#',
          style: TextStyle(
            fontFamily: "LexendDecaRegular",
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
    }

    columns.addAll(
      widget.headers.map(
        (header) => DataColumn(
          label: Text(
            header,
            style: const TextStyle(
              fontFamily: "LexendDecaRegular",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    return columns;
  }

  List<DataRow> _buildRows() {
    return List<DataRow>.generate(
      widget.data.length,
      (index) => DataRow(
        cells: _buildRowCells(index),
        selected: false,
        onSelectChanged: (selected) {
          // Implement row selection
        },
      ),
    );
  }

  List<DataCell> _buildRowCells(int rowIndex) {
    List<DataCell> cells = [];

    if (widget.showRowNumbers) {
      cells.add(DataCell(Text(
        '${rowIndex + 1}',
        style: const TextStyle(
          fontFamily: "LexendDecaRegular",
          color: Colors.grey,
        ),
      )));
    }

    cells.addAll(
      widget.data[rowIndex].map(
        (cell) => DataCell(
          Text(
            cell.toString(),
            style: const TextStyle(
              fontFamily: "LexendDecaRegular",
            ),
          ),
        ),
      ),
    );

    return cells;
  }

  Widget _buildTotalRow() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          Text(
            'Total Rows: ${widget.data.length}',
            style: const TextStyle(
              fontFamily: "LexendDecaRegular",
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      icon: Icon(icon),
      tooltip: tooltip,
      onPressed: onPressed,
      splashRadius: 24,
    );
  }

  Widget _buildToolbarButton({
    required IconData icon,
    required String label,
  }) {
    return TextButton.icon(
      onPressed: () {
        // Implement button functionality
      },
      icon: Icon(icon, size: 18),
      label: Text(
        label,
        style: const TextStyle(
          fontFamily: "LexendDecaRegular",
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        foregroundColor: Colors.grey[700],
      ),
    );
  }
}

// Example usage:
class ExampleReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data
    final headers = ['Name', 'Department', 'Position', 'Salary', 'Join Date'];
    final data = [
      ['John Doe', 'IT', 'Developer', '\$95,000', '2023-01-15'],
      ['Jane Smith', 'HR', 'Manager', '\$85,000', '2022-06-20'],
      ['Mike Johnson', 'Sales', 'Executive', '\$75,000', '2023-03-10'],
      ['Sarah Brown', 'Marketing', 'Specialist', '\$65,000', '2023-02-01'],
      ['Robert Wilson', 'IT', 'Senior Developer', '\$105,000', '2022-09-15'],
    ];

    return Scaffold(
      body: ExcelReportContainer(
        title: 'Employee Report',
        headers: headers,
        data: data,
        showRowNumbers: true,
        showTotalRow: true,
      ),
    );
  }
}
