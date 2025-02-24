import 'package:flutter/material.dart';
import 'package:employee_client_management/dashboard/calander/calender_wid.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String searchText = '';
  final TextEditingController _searchController = TextEditingController();
  bool isExpanded = false;
  final TextEditingController _noteController = TextEditingController();
  final int maxCharacters = 20;

  @override
  void dispose() {
    _searchController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        "Attendance",
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontFamily: "LexendDecaRegular",
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Widget _buildCalendarSection() {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: const CalendarWidget(),
    );
  }

  Widget _buildSearchField() {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(
          fontFamily: "LexendDecaRegular",
          fontSize: 16,
        ),
        cursorColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        decoration: InputDecoration(
          hintText: "Search Employee",
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontFamily: "LexendDecaRegular",
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.5),
          ),
          suffixIcon: searchText.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      searchText = '';
                      _searchController.clear();
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 224, 220, 220),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableNote() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            'Add Note (${_noteController.text.length}/$maxCharacters)',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontFamily: "LexendDecaRegular",
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _noteController,
            maxLength: maxCharacters,
            style: const TextStyle(
              fontFamily: "LexendDecaRegular",
              fontSize: 14,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              counterText: '',
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _noteController.clear();
                  });
                },
                child: const Text(
                  'Clear',
                  style: TextStyle(
                      fontFamily: "LexendDecaRegular", color: Colors.black),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isExpanded = false;
                    // Handle save functionality here
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  foregroundColor: Colors.white, // Text color
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontFamily: "LexendDecaRegular"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeCard() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: const Color.fromARGB(255, 234, 232, 232),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset(
                    "icons/man_4140057.png",
                    height: 46,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "John David",
                          style: TextStyle(
                            fontFamily: "LexendDecaRegular",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Automotive Manufacturing',
                          style: TextStyle(
                            fontFamily: "LexendDecaRegular",
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                        Divider(),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Present",
                                style: TextStyle(
                                    fontFamily: "LexendDecaRegular",
                                    color: Colors.blue),
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Absent",
                                  style: TextStyle(
                                      fontFamily: "LexendDecaRegular",
                                      color: Colors.red),
                                )),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              icon: AnimatedRotation(
                                duration: const Duration(milliseconds: 300),
                                turns: isExpanded ? 0.5 : 0,
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isExpanded)
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey),
                  ),
                ),
                child: _buildExpandableNote(),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildCalendarSection(),
          _buildSearchField(),
          _buildEmployeeCard(),
          // Add more employee cards here
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add new attendance record
      //   },
      //   backgroundColor: Colors.blue,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
