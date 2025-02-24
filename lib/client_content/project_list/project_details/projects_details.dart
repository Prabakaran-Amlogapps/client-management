// import 'package:amplify_datastore/amplify_datastore.dart';
// import 'package:employee_client_management/client_content/project_list/project%20services/project_services.dart';
// import 'package:employee_client_management/models/Project.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:uuid/uuid.dart';

// class ProjectsDetails extends StatefulWidget {
//   final Project? project;

//   const ProjectsDetails({super.key, this.project});

//   @override
//   State<ProjectsDetails> createState() => _ProjectsDetailsState();
// }

// class _ProjectsDetailsState extends State<ProjectsDetails> {
//   final _formKey = GlobalKey<FormState>();
//   final _projectService = ProjectService();
//   late final TextEditingController _projectController;
//   late final TextEditingController _clientController;
//   late final TextEditingController _dateController;
//   late final TextEditingController _locationController;
//   late final TextEditingController _contactpersonController;
//   late final TextEditingController _contactnumberController;
//   late final TextEditingController _totalCostController;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _projectController =
//         TextEditingController(text: widget.project?.projectName);
//     _clientController = TextEditingController(text: widget.project?.clientName);
//     _dateController = TextEditingController(
//         text: widget.project?.projectDate != null
//             ? DateFormat('yyyy-MM-dd')
//                 .format(widget.project!.projectDate as DateTime)
//             : '');
//     _locationController = TextEditingController(text: widget.project?.location);
//     _contactpersonController =
//         TextEditingController(text: widget.project?.contactPerson);
//     _contactnumberController =
//         TextEditingController(text: widget.project?.contactNumber);
//     _totalCostController = TextEditingController(
//         text: widget.project?.totalCost?.toString() ?? '');
//   }

//   @override
//   void dispose() {
//     _projectController.dispose();
//     _clientController.dispose();
//     _dateController.dispose();
//     _locationController.dispose();
//     _contactpersonController.dispose();
//     _contactnumberController.dispose();
//     _totalCostController.dispose();
//     super.dispose();
//   }

//   Future<void> _saveProject() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => _isLoading = true);

//     try {
//       final project = Project(
//         id: widget.project?.id ?? const Uuid().v4(),
//         projectName: _projectController.text,
//         clientName: _clientController.text,
//         projectDate: TemporalDateTime(
//             DateFormat('yyyy-MM-dd').parse(_dateController.text)),
//         location: _locationController.text,
//         contactPerson: _contactpersonController.text,
//         contactNumber: _contactnumberController.text,
//         totalCost: double.parse(_totalCostController.text),
//       );

//       if (widget.project == null) {
//         await _projectService.createProject(project);
//       } else {
//         await _projectService.updateProject(project);
//       }

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(
//                   'Project ${widget.project == null ? 'created' : 'updated'} successfully')),
//         );
//         Navigator.pop(context, true);
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${e.toString()}')),
//         );
//       }
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _deleteProject() async {
//     if (widget.project == null) return;

//     setState(() => _isLoading = true);

//     try {
//       await _projectService.deleteProject(widget.project!.id);
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Project deleted successfully')),
//         );
//         Navigator.pop(context, true);
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${e.toString()}')),
//         );
//       }
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isSmallScreen = screenSize.width < 600;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           widget.project == null ? "New Project" : "Edit Project",
//           style: const TextStyle(fontFamily: "LexendDecaRegular"),
//         ),
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.arrow_back_ios_new),
//         ),
//         actions: widget.project != null
//             ? [
//                 IconButton(
//                   onPressed: _isLoading ? null : _deleteProject,
//                   icon: const Icon(Icons.delete, color: Colors.red),
//                 ),
//               ]
//             : null,
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
//                 child: Card(
//                   color: const Color.fromARGB(255, 244, 242, 242),
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Text(
//                             widget.project == null
//                                 ? "New Project Details"
//                                 : "Edit Project Details",
//                             style: const TextStyle(
//                               fontFamily: "LexendDecaRegular",
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           _buildTextField(
//                             controller: _projectController,
//                             label: "Project Name",
//                             icon: Icons.task,
//                             validator: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'Please enter project name';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16),
//                           _buildTextField(
//                             controller: _clientController,
//                             label: "Client Name",
//                             icon: Icons.person,
//                             validator: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'Please enter client name';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16),
//                           _buildDateField(context),
//                           const SizedBox(height: 16),
//                           _buildTextField(
//                             controller: _locationController,
//                             label: "Location",
//                             icon: Icons.location_on,
//                             validator: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'Please enter location';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16),
//                           _buildTextField(
//                             controller: _contactpersonController,
//                             label: "Contact Person",
//                             icon: Icons.person_2,
//                             validator: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'Please enter contact person';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16),
//                           _buildTextField(
//                             controller: _contactnumberController,
//                             label: "Contact Number",
//                             icon: Icons.phone,
//                             keyboardType: TextInputType.phone,
//                             validator: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'Please enter contact number';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16),
//                           _buildTextField(
//                             controller: _totalCostController,
//                             label: "Total Cost",
//                             icon: Icons.money,
//                             keyboardType: TextInputType.number,
//                             validator: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'Please enter total cost';
//                               }
//                               if (double.tryParse(value!) == null) {
//                                 return 'Please enter a valid number';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 32),
//                           SizedBox(
//                             height: 50,
//                             child: ElevatedButton(
//                               onPressed: _isLoading ? null : _saveProject,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue,
//                                 foregroundColor: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                               child: Text(
//                                 widget.project == null
//                                     ? "Create Project"
//                                     : "Update Project",
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "LexendDecaRegular",
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     TextInputType? keyboardType,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(fontFamily: "LexendDecaRegular"),
//         prefixIcon: Icon(icon, color: Colors.blue),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.blue),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.blue, width: 2),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.grey),
//         ),
//         filled: true,
//         fillColor: Colors.grey[50],
//       ),
//       validator: validator,
//     );
//   }

//   Widget _buildDateField(BuildContext context) {
//     return TextFormField(
//       controller: _dateController,
//       readOnly: true,
//       decoration: InputDecoration(
//         labelText: "Project Date",
//         labelStyle: const TextStyle(fontFamily: "LexendDecaRegular"),
//         prefixIcon: const Icon(Icons.calendar_today, color: Colors.blue),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.blue),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.blue, width: 2),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.grey),
//         ),
//         filled: true,
//         fillColor: Colors.grey[50],
//       ),
//       validator: (value) {
//         if (value?.isEmpty ?? true) {
//           return 'Please select a date';
//         }
//         return null;
//       },
//       onTap: () async {
//         // Hide keyboard
//         FocusScope.of(context).requestFocus(FocusNode());

//         // Show date picker
//         final DateTime? picked = await showDatePicker(
//           context: context,
//           initialDate: _dateController.text.isNotEmpty
//               ? DateFormat('yyyy-MM-dd').parse(_dateController.text)
//               : DateTime.now(),
//           firstDate: DateTime(2000),
//           lastDate: DateTime(2100),
//           builder: (context, child) {
//             return Theme(
//               data: Theme.of(context).copyWith(
//                 colorScheme: const ColorScheme.light(
//                   primary: Colors.blue,
//                   onPrimary: Colors.white,
//                   surface: Colors.white,
//                   onSurface: Colors.black,
//                 ),
//                 dialogBackgroundColor: Colors.white,
//               ),
//               child: child!,
//             );
//           },
//         );

//         if (picked != null) {
//           setState(() {
//             _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
//           });
//         }
//       },
//     );
//   }
// }
