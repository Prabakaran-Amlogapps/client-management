// lib/screens/employee_list_screen.dart

import 'package:amplify_api/amplify_api.dart';
import 'package:employee_client_management/employee_content/employee_components/employee/screens/employee_form.dart';
import 'package:employee_client_management/employee_content/employee_components/employee/model/models.dart';
import 'package:employee_client_management/employee_content/employee_components/employee/services/services_employee.dart';
import 'package:employee_client_management/employee_content/employee_components/employee/screens/employee_details.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final _storageService = StorageService();
  List<Employee> _employees = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchEmployees();
  }

  Future<void> _fetchEmployees() async {
    try {
      final request = ModelQueries.list(Employee.classType);
      final response = await Amplify.API.query(request: request).response;

      final employees = response.data?.items.whereType<Employee>().toList() ?? [];
      
      // Update image URLs for employees with images
      final updatedEmployees = await Future.wait(
        employees.map((employee) async {
          if (employee.image != null) {
            final imageUrl = await _storageService.getDownloadUrl(employee.image!);
            return employee.copyWith(image: imageUrl);
          }
          return employee;
        }),
      );

      setState(() {
        _employees = updatedEmployees;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching employees: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteEmployee(Employee employee) async {
    try {
      final request = ModelMutations.delete<Employee>(employee);
      await Amplify.API.mutate(request: request).response;

      // Delete associated files if they exist
      if (employee.image != null) {
        await _storageService.deleteFile(employee.image!);
      }
      if (employee.proofDocument != null) {
        await _storageService.deleteFile(employee.proofDocument!);
      }

      setState(() {
        _employees.removeWhere((e) => e.id == employee.id);
      });
    } catch (e) {
      print('Error deleting employee: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting employee: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchEmployees,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _employees.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No employees found',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmployeeFormScreen(),
                          ),
                        ).then((_) => _fetchEmployees()),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Employee'),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _fetchEmployees,
                  child: ListView.builder(
                    itemCount: _employees.length,
                    itemBuilder: (context, index) {
                      final employee = _employees[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: employee.image != null
                                ? NetworkImage(employee.image!)
                                : null,
                            child: employee.image == null
                                ? Text(employee.name[0])
                                : null,
                          ),
                          title: Text(employee.name),
                          subtitle: Text(employee.position),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'view',
                                child: Text('View Details'),
                              ),
                              const PopupMenuItem(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                            onSelected: (value) {
                              switch (value) {
                                case 'view':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EmployeeDetailScreen(
                                        employee: employee,
                                      ),
                                    ),
                                  );
                                  break;
                                case 'edit':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EmployeeFormScreen(
                                        employee: employee,
                                      ),
                                    ),
                                  ).then((_) => _fetchEmployees());
                                  break;
                                case 'delete':
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Employee'),
                                      content: Text(
                                        'Are you sure you want to delete ${employee.name}?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _deleteEmployee(employee);
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                  break;
                              }
                            },
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeeDetailScreen(
                                employee: employee,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EmployeeFormScreen(),
          ),
        ).then((_) => _fetchEmployees()),
        child: const Icon(Icons.add),
      ),
    );
  }
}