import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../../../../models/Project.dart';

class ProjectFormScreen extends StatefulWidget {
  final Project? project;

  ProjectFormScreen({this.project});

  @override
  _ProjectFormScreenState createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _projectNameController;
  late TextEditingController _clientNameController;
  late TextEditingController _locationController;
  late TextEditingController _contactPersonController;
  late TextEditingController _contactNumberController;
  late TextEditingController _totalCostController;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _projectNameController =
        TextEditingController(text: widget.project?.projectName);
    _clientNameController =
        TextEditingController(text: widget.project?.clientName);
    _locationController = TextEditingController(text: widget.project?.location);
    _contactPersonController =
        TextEditingController(text: widget.project?.contactPerson);
    _contactNumberController =
        TextEditingController(text: widget.project?.contactNumber);
    _totalCostController = TextEditingController(
      text: widget.project?.totalCost.toString() ?? '',
    );
    if (widget.project != null) {
      _selectedDate = DateTime.parse(widget.project!.projectDate.toString());
    }
  }

  Future<void> _saveProject() async {
    if (_formKey.currentState!.validate()) {
      try {
        final currentDateTime = TemporalDateTime(DateTime.now());
        final project = Project(
            id: widget.project?.id ?? UUID.getUUID(),
            projectName: _projectNameController.text,
            clientName: _clientNameController.text,
            projectDate: TemporalDateTime(_selectedDate),
            location: _locationController.text,
            contactPerson: _contactPersonController.text,
            contactNumber: _contactNumberController.text,
            totalCost: double.parse(_totalCostController.text),
            receivedAmount: widget.project?.receivedAmount ?? 0.0,
            pendingAmount: widget.project?.pendingAmount ?? 0.0,
            createdAt: widget.project?.createdAt ?? currentDateTime,
            updatedAt: currentDateTime);

        if (widget.project == null) {
          await Amplify.DataStore.save(project);
        } else {
          await Amplify.DataStore.save(project);
        }

        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Project saved successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving project: ${e.toString()}')),
        );
      }
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
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(widget.project == null ? 'Add Project' : 'Edit Project'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Container(
                  child: Card(
                      child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.project == null ? 'Add Project' : 'Edit Project',
                      style: TextStyle(
                          fontFamily: "LexendDecaRegular", fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _projectNameController,
                      decoration: InputDecoration(
                          labelText: 'Project Name',
                          labelStyle:
                              TextStyle(fontFamily: "LexendDecaRegular"),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter project name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _clientNameController,
                      decoration: InputDecoration(
                          labelText: 'Client Name',
                          labelStyle:
                              TextStyle(fontFamily: "LexendDecaRegular"),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter client name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      title: Text('Project Date'),
                      subtitle: Text(_selectedDate.toString().split(' ')[0]),
                      trailing: Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                      ),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() => _selectedDate = picked);
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _locationController,
                      decoration: InputDecoration(
                          labelText: 'Location',
                          labelStyle:
                              TextStyle(fontFamily: "LexendDecaRegular"),
                          prefixIcon: Icon(
                            Icons.map,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter location';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _contactPersonController,
                      decoration: InputDecoration(
                          labelText: 'Contact Person',
                          labelStyle:
                              TextStyle(fontFamily: "LexendDecaRegular"),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter contact person';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _contactNumberController,
                      decoration: InputDecoration(
                          labelText: 'Contact Number',
                          labelStyle:
                              TextStyle(fontFamily: "LexendDecaRegular"),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter contact number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _totalCostController,
                      decoration: InputDecoration(
                          labelText: 'Total Cost',
                          labelStyle:
                              TextStyle(fontFamily: "LexendDecaRegular"),
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter total cost';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _saveProject,
                      child: Text(
                        'Save Project',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.blue),
                    ),
                  ],
                ),
              )))),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _projectNameController.dispose();
    _clientNameController.dispose();
    _locationController.dispose();
    _contactPersonController.dispose();
    _contactNumberController.dispose();
    _totalCostController.dispose();
    super.dispose();
  }
}
