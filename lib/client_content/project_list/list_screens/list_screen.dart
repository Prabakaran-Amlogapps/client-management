import 'package:employee_client_management/client_content/project_list/list_screens/form_screen/form_project.dart';
import 'package:employee_client_management/models/Project.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class ProjectListScreen extends StatefulWidget {
  @override
  _ProjectListScreenState createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  List<Project> _projects = [];
  List<Project> _filteredProjects = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchProjects();
    _searchController.addListener(_filterProjects);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterProjects() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProjects = _projects.where((project) {
        return project.projectName.toLowerCase().contains(query) ||
            project.clientName.toLowerCase().contains(query) ||
            project.location.toLowerCase().contains(query) ||
            project.contactPerson.toLowerCase().contains(query);
      }).toList();
    });
  }

  Future<void> _fetchProjects() async {
    try {
      setState(() => _isLoading = true);
      final projectsData = await Amplify.DataStore.query(Project.classType);
      setState(() {
        _projects = projectsData;
        _filteredProjects = projectsData;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching projects: $e');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _deleteProject(Project project) async {
    try {
      await Amplify.DataStore.delete(project);
      await _fetchProjects();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Project deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting project')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text('Project Details'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 10),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search projects...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              )),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProjectFormScreen()));
                    },
                    icon: Icon(Icons.add)),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Project List",
              style: TextStyle(fontFamily: "LexendDecaRegular", fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _filteredProjects.length,
                    itemBuilder: (context, index) {
                      final project = _filteredProjects[index];
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child:
                                    Text(project.projectName[0].toUpperCase()),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project.projectName,
                                    style: TextStyle(
                                      fontFamily: "LexendDecaRegular",
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Client: ${project.clientName}',
                                    style: TextStyle(
                                      fontFamily: "LexendDecaRegular",
                                      color:
                                          const Color.fromARGB(255, 94, 89, 89),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Image.asset(
                                "icons/pngegg.png",
                                height: 27,
                                color: Colors.green,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.phone,
                                color: Colors.blue,
                              ),
                              PopupMenuButton(
                                onSelected: (String value) {
                                  if (value == "edit") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProjectFormScreen(
                                          project: project,
                                        ),
                                      ),
                                    ).then((_) => _fetchProjects());
                                  } else if (value == "delete") {
                                    _deleteProject(project);
                                  } else if (value == "details") {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(project.projectName),
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                'Client: ${project.clientName}'),
                                            Text(
                                                'Date: ${project.projectDate}'),
                                            Text(
                                                'Location: ${project.location}'),
                                            Text(
                                                'Contact: ${project.contactPerson}'),
                                            Text(
                                                'Cost: \$${project.totalCost}'),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('Close'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem(
                                    value: "edit",
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit, color: Colors.blue),
                                        SizedBox(width: 10),
                                        Text("Edit"),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: "delete",
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete, color: Colors.red),
                                        SizedBox(width: 10),
                                        Text("Delete"),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: "details",
                                    child: Row(
                                      children: [
                                        Icon(Icons.info, color: Colors.green),
                                        SizedBox(width: 10),
                                        Text("Details"),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => ProjectFormScreen(),
      //       ),
      //     ).then((_) => _fetchProjects());
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
