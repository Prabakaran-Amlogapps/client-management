import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:employee_client_management/client_content/client_list/models/model_client.dart'
    as model_client;
import 'package:employee_client_management/client_content/client_list/services/services_client.dart';
import 'package:employee_client_management/models/Client.dart' as main_client;
import 'package:employee_client_management/models/Client.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class AddClientDetails extends StatefulWidget {
  final Client? clientToEdit; // Optional parameter for editing existing client

  const AddClientDetails({super.key, this.clientToEdit});

  @override
  State<AddClientDetails> createState() => _AddClientDetailsState();
}

class _AddClientDetailsState extends State<AddClientDetails> {
  final _formKey = GlobalKey<FormState>();
  final _clientService = ClientService();

  // Text editing controllers
  final _companyNameController = TextEditingController();
  final _personNameController = TextEditingController();
  final _positionController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _onboardDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.clientToEdit != null) {
      // Populate fields if editing existing client
      _companyNameController.text = widget.clientToEdit!.companyName;
      _personNameController.text = widget.clientToEdit!.personName;
      _positionController.text = widget.clientToEdit!.position;
      _contactNumberController.text = widget.clientToEdit!.contactNumber;
      _emailController.text = widget.clientToEdit!.email;
      _addressController.text = widget.clientToEdit!.address;
      _onboardDateController.text = DateFormat('yyyy-MM-dd')
          .format(widget.clientToEdit!.onboardDate as DateTime);
    }
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _personNameController.dispose();
    _positionController.dispose();
    _contactNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _onboardDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _onboardDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _saveClient() async {
    if (_formKey.currentState!.validate()) {
      try {
        final client = main_client.Client(
          id: widget.clientToEdit?.id ?? const Uuid().v4(),
          companyName: _companyNameController.text,
          personName: _personNameController.text,
          position: _positionController.text,
          contactNumber: _contactNumberController.text,
          email: _emailController.text,
          address: _addressController.text,
          onboardDate:
              TemporalDateTime(DateTime.parse(_onboardDateController.text)),
        );

        if (widget.clientToEdit != null) {
          await _clientService.updateClient(client);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Client updated successfully')),
          );
        } else {
          await _clientService.createClient(client as main_client.Client);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Client saved successfully')),
          );
        }
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving client: $e')),
        );
      }
    }
  }

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.clientToEdit != null ? "Edit Client" : "Add Client",
          style: TextStyle(fontFamily: "LexendDecaRegular"),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
          child: Card(
            color: const Color.fromARGB(255, 244, 242, 242),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.clientToEdit != null
                          ? "Edit Client Details"
                          : "Client Details",
                      style: TextStyle(
                        fontFamily: "LexendDecaRegular",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildTextField(
                      controller: _companyNameController,
                      label: "Company Name",
                      icon: Icons.location_city_sharp,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter company name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _personNameController,
                      label: "Person Name",
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter person name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _positionController,
                      label: "Position",
                      icon: Icons.business,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter position';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _contactNumberController,
                      label: "Contact Number",
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter contact number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _emailController,
                      label: "E-mail",
                      icon: Icons.mail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _addressController,
                      label: "Address",
                      icon: Icons.map,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: _buildTextField(
                          controller: _onboardDateController,
                          label: "Onboard date",
                          icon: Icons.calendar_month,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select onboard date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _saveClient,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          widget.clientToEdit != null
                              ? "Update Details"
                              : "Save Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "LexendDecaRegular",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontFamily: "LexendDecaRegular"),
        hintStyle: TextStyle(fontFamily: "LexendDecaRegular"),
        prefixIcon: Icon(icon, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      validator: validator,
    );
  }
}
