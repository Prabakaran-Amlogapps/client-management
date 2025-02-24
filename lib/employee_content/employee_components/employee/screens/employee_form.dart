// lib/screens/employee_form_screen.dart

import 'dart:io';
import 'package:amplify_api/amplify_api.dart';
import 'package:employee_client_management/employee_content/employee_components/employee/model/models.dart';
import 'package:employee_client_management/employee_content/employee_components/employee/services/services_employee.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class EmployeeFormScreen extends StatefulWidget {
  final Employee? employee;

  const EmployeeFormScreen({Key? key, this.employee}) : super(key: key);

  @override
  _EmployeeFormScreenState createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _storageService = StorageService();
  
  late TextEditingController _nameController;
  late TextEditingController _positionController;
  late TextEditingController _salaryController;
  late TextEditingController _currentAddressController;
  late TextEditingController _permanentAddressController;
  late TextEditingController _mobileController;
  
  DateTime _selectedDate = DateTime.now();
  String _gender = 'Male';
  bool _sameAsAbove = false;
  File? _imageFile;
  File? _proofFile;
  
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.employee?.name);
    _positionController = TextEditingController(text: widget.employee?.position);
    _salaryController = TextEditingController(text: widget.employee?.salary.toString());
    _currentAddressController = TextEditingController(text: widget.employee?.currentAddress);
    _permanentAddressController = TextEditingController(text: widget.employee?.permanentAddress);
    _mobileController = TextEditingController(text: widget.employee?.mobileNumber);
    
    if (widget.employee != null) {
      _selectedDate = widget.employee!.dateOfJoining;
      _gender = widget.employee!.gender;
      _sameAsAbove = widget.employee!.sameAsAbove;
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickProof() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _proofFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveEmployee() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      String? imageKey;
      String? proofKey;

      if (_imageFile != null) {
        imageKey = await _storageService.uploadFile(_imageFile!, 'images');
      }

      if (_proofFile != null) {
        proofKey = await _storageService.uploadFile(_proofFile!, 'proofs');
      }

      final employee = Employee(
        id: widget.employee?.id ?? UUID.getUUID(),
        name: _nameController.text,
        image: imageKey ?? widget.employee?.image,
        dateOfJoining: _selectedDate,
        gender: _gender,
        position: _positionController.text,
        salary: double.parse(_salaryController.text),
        currentAddress: _currentAddressController.text,
        permanentAddress: _sameAsAbove 
          ? _currentAddressController.text 
          : _permanentAddressController.text,
        sameAsAbove: _sameAsAbove,
        mobileNumber: _mobileController.text,
        proofDocument: proofKey ?? widget.employee?.proofDocument,
      );

      final request = widget.employee == null
          ? ModelMutations.create(employee)
          : ModelMutations.update(employee);

      await Amplify.API.mutate(request: request).response;

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving employee: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.employee == null ? 'Add Employee' : 'Edit Employee'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _imageFile != null 
                      ? FileImage(_imageFile!) as ImageProvider 
                      : null,
                    child: _imageFile == null ? const Icon(Icons.add_a_photo) : null,
                  ),
                ),
              ),
              
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
              
              const SizedBox(height: 16),
              
              ListTile(
                title: const Text('Date of Joining'),
                subtitle: Text(DateFormat('dd/MM/yyyy').format(_selectedDate)),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    setState(() => _selectedDate = date);
                  }
                },
              ),
              
              const SizedBox(height: 16),
              
              Row(
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value.toString()),
                  ),
                  const Text('Male'),
                  Radio(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value.toString()),
                  ),
                  const Text('Female'),
                ],
              ),
              
              TextFormField(
                controller: _positionController,
                decoration: const InputDecoration(labelText: 'Position'),
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
              
              TextFormField(
                controller: _salaryController,
                decoration: const InputDecoration(labelText: 'Salary'),
                keyboardType: TextInputType.number,
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
              
              TextFormField(
                controller: _currentAddressController,
                decoration: const InputDecoration(labelText: 'Current Address'),
                maxLines: 3,
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
              
              CheckboxListTile(
                title: const Text('Permanent Address Same as Above'),
                value: _sameAsAbove,
                onChanged: (value) {
                  setState(() {
                    _sameAsAbove = value ?? false;
                    if (_sameAsAbove) {
                      _permanentAddressController.text = _currentAddressController.text;
                    }
                  });
                },
              ),
              
              if (!_sameAsAbove)
                TextFormField(
                  controller: _permanentAddressController,
                  decoration: const InputDecoration(labelText: 'Permanent Address'),
                  maxLines: 3,
                  validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                ),
              
              TextFormField(
                controller: _mobileController,
                decoration: const InputDecoration(labelText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
              
              const SizedBox(height: 16),
              
              ElevatedButton.icon(
                onPressed: _pickProof,
                icon: const Icon(Icons.upload_file),
                label: const Text('Upload Proof Document'),
              ),
              
              if (_proofFile != null)
                Text('Selected file: ${_proofFile!.path.split('/').last}'),
              
              const SizedBox(height: 24),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveEmployee,
                  child: Text(widget.employee == null ? 'Add Employee' : 'Update Employee'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    _salaryController.dispose();
    _currentAddressController.dispose();
    _permanentAddressController.dispose();
    _mobileController.dispose();
    super.dispose();
  }
}