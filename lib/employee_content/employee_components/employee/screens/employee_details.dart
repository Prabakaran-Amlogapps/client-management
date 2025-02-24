import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:employee_client_management/employee_content/employee_components/employee/model/models.dart';
import 'package:employee_client_management/employee_content/employee_components/employee/screens/employee_form.dart';
import 'package:employee_client_management/employee_content/employee_components/employee/services/services_employee.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class EmployeeDetailScreen extends StatefulWidget {
  final Employee employee;
  const EmployeeDetailScreen({
    Key? key,
    required this.employee,
  }) : super(key: key);
  @override
  _EmployeeDetailScreenState createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  final StorageService _storageService = StorageService();
  String? _proofDocumentUrl;
  bool _isLoadingProof = false;

  @override
  void initState() {
    super.initState();
    _loadProofDocument();
  }

  Future<void> _loadProofDocument() async {
    if (widget.employee.proofDocument != null) {
      setState(() => _isLoadingProof = true);
      try {
        final url = await _storageService.getDownloadUrl(widget.employee.proofDocument!);
        setState(() {
          _proofDocumentUrl = url;
          _isLoadingProof = false;
        });
      } catch (e) {
        setState(() => _isLoadingProof = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading proof document: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _uploadProofDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() => _isLoadingProof = true);
      try {
        final file = File(result.files.single.path!);
        // Upload file to storage
        final uploadUrl = await _storageService.uploadFile(file, 'proofs');
        // Update employee record with proof document URL
        final updatedEmployee = widget.employee.copyWith(proofDocument: uploadUrl);
        final request = ModelMutations.update<Employee>(updatedEmployee);
        await Amplify.API.mutate(request: request).response;
        setState(() {
          _proofDocumentUrl = uploadUrl;
          _isLoadingProof = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Document uploaded successfully!')),
        );
      } catch (e) {
        setState(() => _isLoadingProof = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading document: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _deleteEmployee() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Employee'),
        content: Text('Are you sure you want to delete ${widget.employee.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      try {
        // Delete employee image if exists
        if (widget.employee.image != null) {
          await _storageService.deleteFile(widget.employee.image!);
        }
        // Delete proof document if exists
        if (widget.employee.proofDocument != null) {
          await _storageService.deleteFile(widget.employee.proofDocument!);
        }
        // Delete employee record
        final request = ModelMutations.delete(widget.employee);
        await Amplify.API.mutate(request: request).response;
        Navigator.of(context).pop(true); // Return true to indicate deletion
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting employee: ${e.toString()}')),
        );
      }
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeFormScreen(
                    employee: widget.employee,
                  ),
                ),
              ).then((value) {
                if (value == true) {
                  Navigator.pop(context, true); // Refresh list
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteEmployee,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.employee.image != null)
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.employee.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.employee.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.employee.position,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const Divider(height: 32),
                  _buildInfoRow(
                    'Joining Date',
                    DateFormat('dd MMM yyyy').format(widget.employee.dateOfJoining),
                  ),
                  _buildInfoRow('Gender', widget.employee.gender),
                  _buildInfoRow(
                    'Salary',
                    NumberFormat.currency(symbol: '\$').format(widget.employee.salary),
                  ),
                  _buildInfoRow('Mobile', widget.employee.mobileNumber),
                  const Divider(height: 32),
                  const Text(
                    'Proof Document',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_isLoadingProof)
                    const Center(child: CircularProgressIndicator())
                  else if (_proofDocumentUrl != null)
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.description),
                        title: const Text('View Document'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Open document
                        },
                      ),
                    )
                  else
                    const Text(
                      'No proof document uploaded',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _uploadProofDocument,
                    child: const Text('Upload Document'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}