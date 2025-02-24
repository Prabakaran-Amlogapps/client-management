import 'package:employee_client_management/client_content/client_list/list_screen.dart/lists_screens.dart';
import 'package:employee_client_management/client_content/project_list/project_details/projects_details.dart';
import 'package:flutter/material.dart';

class ProjectLists extends StatefulWidget {
  const ProjectLists({super.key});

  @override
  State<ProjectLists> createState() => _ProjectListsState();
}

class _ProjectListsState extends State<ProjectLists> {
  String searchText = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Project List",
          style: TextStyle(
            fontFamily: "LexendDecaRegular",
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
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
                            )
                          ]),
                      child: TextField(
                        controller: _searchController,
                        style: TextStyle(
                            fontFamily: "LexendDecaRegular", fontSize: 16),
                        cursorColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search Client',
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
                        // Navigating to project details

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientListPage()));
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
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  "Project List",
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
                                  // whatsapp icon
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
            ],
          ),
        ),
      ),
    );
  }
}
