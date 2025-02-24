import 'package:employee_client_management/models/EmployeePayment.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:intl/intl.dart';

class EmployeePaymentForm extends StatefulWidget {
  final EmployeePayment? payment;

  const EmployeePaymentForm({Key? key, this.payment}) : super(key: key);

  @override
  _EmployeePaymentFormState createState() => _EmployeePaymentFormState();
}

class _EmployeePaymentFormState extends State<EmployeePaymentForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _fullNameController;
  late TextEditingController _totalSalaryController;
  late TextEditingController _currentSalaryController;
  late TextEditingController _remainSalaryController;
  late TextEditingController _positionController;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fullNameController =
        TextEditingController(text: widget.payment?.fullName ?? '');
    _totalSalaryController = TextEditingController(
        text: widget.payment?.totalSalary.toString() ?? '');
    _currentSalaryController = TextEditingController(
        text: widget.payment?.currentSalary.toString() ?? '');
    _remainSalaryController = TextEditingController(
        text: widget.payment?.remainSalary.toString() ?? '');
    _positionController =
        TextEditingController(text: widget.payment?.position ?? '');

    if (widget.payment != null) {
      // Convert TemporalDateTime to DateTime
      _selectedDate = DateTime.parse(widget.payment!.date.toString());
    }
  }

  Future<void> _savePayment() async {
    if (_formKey.currentState!.validate()) {
      try {
        final payment = EmployeePayment(
          fullName: _fullNameController.text,
          date: TemporalDateTime(_selectedDate),
          totalSalary: double.parse(_totalSalaryController.text),
          currentSalary: double.parse(_currentSalaryController.text),
          remainSalary: double.parse(_remainSalaryController.text),
          position: _positionController.text,
        );

        if (widget.payment == null) {
          // Create new payment
          await Amplify.DataStore.save(payment);
        } else {
          // Update existing payment
          final updatedPayment = widget.payment!.copyWith(
            fullName: _fullNameController.text,
            date: TemporalDateTime(_selectedDate),
            totalSalary: double.parse(_totalSalaryController.text),
            currentSalary: double.parse(_currentSalaryController.text),
            remainSalary: double.parse(_remainSalaryController.text),
            position: _positionController.text,
          );
          await Amplify.DataStore.save(updatedPayment);
        }

        if (!mounted) return;
        Navigator.pop(context);
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving payment: ${e.toString()}')),
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
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Card(
                child: Container(
              margin: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.payment == null ? 'Add Details' : 'Edit Details',
                        style: TextStyle(
                          fontFamily: "LexendDecaRegular",
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(fontFamily: "LexendDecaRegular"),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: ListTile(
                        title: Text(
                            'Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}'),
                        trailing: const Icon(
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
                            setState(() {
                              _selectedDate = picked;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _totalSalaryController,
                      decoration: const InputDecoration(
                        labelText: 'Total Salary',
                        labelStyle: TextStyle(fontFamily: "LexendDecaRegular"),
                        prefixIcon: Icon(
                          Icons.attach_money,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(),
                        prefixText: '\$ ',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter total salary';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _currentSalaryController,
                      decoration: const InputDecoration(
                        labelText: 'Current Salary',
                        labelStyle: TextStyle(
                          fontFamily: "LexendDecaRegular",
                        ),
                        prefixIcon: Icon(
                          Icons.attach_money,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(),
                        prefixText: '\$ ',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter current salary';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _remainSalaryController,
                      decoration: const InputDecoration(
                        labelText: 'Remain Salary',
                        labelStyle: TextStyle(fontFamily: "LexendDecaRegular"),
                        prefixIcon: Icon(
                          Icons.attach_money,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(),
                        prefixText: '\$ ',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter remain salary';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _positionController,
                      decoration: const InputDecoration(
                        labelText: 'Position',
                        labelStyle: TextStyle(fontFamily: "LexendDecaRegular"),
                        prefixIcon: Icon(
                          Icons.work,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter position';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    Container(
                      child: ElevatedButton(
                        onPressed: _savePayment,
                        style: ElevatedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.blue),
                        child: Text(
                          widget.payment == null
                              ? 'Add Payment'
                              : 'Update Payment',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          )),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _totalSalaryController.dispose();
    _currentSalaryController.dispose();
    _remainSalaryController.dispose();
    _positionController.dispose();
    super.dispose();
  }
}
