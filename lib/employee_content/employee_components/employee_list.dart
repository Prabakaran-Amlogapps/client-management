import 'package:employee_client_management/employee_content/employee_components/add_employee/Add_Employees.dart';
import 'package:flutter/material.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  String searchText = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        ),
        title: const Text(
          'Employees',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: "LexendDecaRegular",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 218, 214, 214)
                              .withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
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
                        hintText: 'Search Employees',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: "LexendDecaRegular",
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 223, 220, 220),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddEmployees()));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                "Employee List",
                style: TextStyle(
                  fontFamily: "LexendDecaRegular",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Divider(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.white,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 246, 246),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        child:
                            Icon(Icons.person_2_outlined, color: Colors.blue),
                      ),
                      const SizedBox(width: 10),
                      Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John david',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "LexendDecaRegular",
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Automotive Manufacturing',
                            style: TextStyle(
                              fontFamily: "LexendDecaRegular",
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )),
                      Spacer(),
                      GestureDetector(
                          child: Container(
                              margin: EdgeInsets.all(13),
                              child: Image.asset(
                                "icons/pngegg.png",
                                height: 28,
                                color: Colors.green,
                              ))),
                      GestureDetector(
                          child: Container(
                        margin: EdgeInsets.only(right: 13),
                        child: Icon(Icons.call, color: Colors.blue),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 0, // Replace with your actual employee list length
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                    child: const ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        "Employee Name", // Replace with actual employee name
                        style: TextStyle(
                          fontFamily: "LexendDecaRegular",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        "Position", // Replace with actual position
                        style: TextStyle(
                          fontFamily: "LexendDecaRegular",
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
