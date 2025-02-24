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
  late TextEditingController _totalAmountController;
  late TextEditingController _receivedAmountController;
  late TextEditingController _pendingAmountController;
  DateTime _selectedDate = DateTime.now();

  double _pendingAmount = 0.0;

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
    _totalAmountController =
        TextEditingController(text: widget.project?.totalCost.toString() ?? '');
    _receivedAmountController = TextEditingController(text: '0');
    _pendingAmountController = TextEditingController(text: '0');

    // Add listeners to calculate pending amount automatically
    _totalAmountController.addListener(_calculatePendingAmount);
    _receivedAmountController.addListener(_calculatePendingAmount);

    if (widget.project != null) {
      _selectedDate = DateTime.parse(widget.project!.projectDate.toString());
    }
  }

  void _calculatePendingAmount() {
    if (_totalAmountController.text.isNotEmpty &&
        _receivedAmountController.text.isNotEmpty) {
      try {
        double totalAmount = double.parse(_totalAmountController.text);
        double receivedAmount = double.parse(_receivedAmountController.text);
        setState(() {
          _pendingAmount = totalAmount - receivedAmount;
          _pendingAmountController.text = _pendingAmount.toStringAsFixed(2);
        });
      } catch (e) {
        // Handle parsing errors
        _pendingAmountController.text = '0.00';
      }
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
            totalCost: double.parse(_totalAmountController.text),
            receivedAmount: double.parse(_receivedAmountController.text),
            pendingAmount: double.parse(_pendingAmountController.text),
            createdAt: widget.project?.createdAt ?? currentDateTime,
            updatedAt: currentDateTime);

        await Amplify.DataStore.save(project);
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
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(widget.project == null ? 'Add Payment' : 'Edit Payment'),
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
                      SizedBox(height: 20),
                      Text(
                        widget.project == null ? 'Add Payment' : 'Edit Payment',
                        style: TextStyle(
                            fontFamily: "LexendDecaRegular", fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      // Previous form fields remain the same until the payment section
                      TextFormField(
                        controller: _projectNameController,
                        decoration: InputDecoration(
                            labelText: 'Project Name',
                            labelStyle:
                                TextStyle(fontFamily: "LexendDecaRegular"),
                            prefixIcon: Icon(Icons.person, color: Colors.blue),
                            border: OutlineInputBorder()),
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Please enter project name'
                            : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _clientNameController,
                        decoration: InputDecoration(
                            labelText: 'Client Name',
                            labelStyle:
                                TextStyle(fontFamily: "LexendDecaRegular"),
                            prefixIcon: Icon(Icons.person, color: Colors.blue),
                            border: OutlineInputBorder()),
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Please enter client name'
                            : null,
                      ),
                      SizedBox(height: 16),
                      // Payment Section
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade100),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Details',
                              style: TextStyle(
                                  fontFamily: "LexendDecaRegular",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: _totalAmountController,
                              decoration: InputDecoration(
                                  labelText: 'Total Amount',
                                  labelStyle: TextStyle(
                                      fontFamily: "LexendDecaRegular"),
                                  prefixIcon: Icon(Icons.attach_money,
                                      color: Colors.blue),
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter total amount';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please enter a valid number';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: _receivedAmountController,
                              decoration: InputDecoration(
                                  labelText: 'Received Amount',
                                  labelStyle: TextStyle(
                                      fontFamily: "LexendDecaRegular"),
                                  prefixIcon:
                                      Icon(Icons.payments, color: Colors.blue),
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter received amount';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please enter a valid number';
                                }
                                double received = double.parse(value);
                                double total =
                                    double.parse(_totalAmountController.text);
                                if (received > total) {
                                  return 'Received amount cannot be greater than total amount';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: _pendingAmountController,
                              decoration: InputDecoration(
                                  labelText: 'Pending Amount',
                                  labelStyle: TextStyle(
                                      fontFamily: "LexendDecaRegular"),
                                  prefixIcon:
                                      Icon(Icons.pending, color: Colors.blue),
                                  border: OutlineInputBorder()),
                              enabled: false, // Make it read-only
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
                ),
              ),
            ),
          ),
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
    _totalAmountController.dispose();
    _receivedAmountController.dispose();
    _pendingAmountController.dispose();
    super.dispose();
  }
}
