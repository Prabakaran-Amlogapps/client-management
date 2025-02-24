import 'package:flutter/material.dart';

class AddEmployees extends StatefulWidget {
  const AddEmployees({super.key});

  @override
  State<AddEmployees> createState() => _AddEmployeesState();
}

class _AddEmployeesState extends State<AddEmployees> {
  bool _sameAsCurrentAddress = false;
  String _selectedGender = 'Male';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 0,
        // backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Add Employee",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: "LexendDecaRegular"),
        ),
      ),
      body: Container(
        // color: Colors.white,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.0),
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 10,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // const Text(
                      //   "ADD EMPLOYEE",
                      //   style: TextStyle(
                      //     fontFamily: "LexendDecaRegular",
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.bold,
                      //     letterSpacing: 1.5,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      // const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Image.asset(
                                  "icons/man_4140057.png",
                                  height: 90,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.blue,
                                    child: IconButton(
                                      icon: const Icon(Icons.camera_alt,
                                          size: 18,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: TextButton(
                                onPressed: () {},
                                child: Text("Edit",
                                    style: TextStyle(
                                        fontFamily: "LexendDecaRegular",
                                        fontSize: 16,
                                        color: Colors.blue))),
                          )
                        ],
                      ),

                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      _buildTextField(
                        label: "Full Name",
                        prefixIcon: Icons.person,
                        validator: (value) =>
                            value?.isEmpty ?? true ? "Name is required" : null,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              label: "Date of Birth",
                              prefixIcon: Icons.calendar_today,
                              readOnly: true,
                              onTap: () async {
                                // Add date picker functionality here
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 160, 149, 149)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        activeColor: Colors.blue,
                                        value: "Male",
                                        groupValue: _selectedGender,
                                        onChanged: (value) {
                                          setState(() => _selectedGender =
                                              value.toString());
                                        },
                                      ),
                                      const Text(
                                        "Male",
                                        style: TextStyle(
                                            fontFamily: "LexendDecaRegular"),
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    Radio(
                                      activeColor: Colors.blue,
                                      value: "Female",
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() =>
                                            _selectedGender = value.toString());
                                      },
                                    ),
                                    const Text("Female",
                                        style: TextStyle(
                                            fontFamily: "LexendDecaRegular")),
                                  ])
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(
                        label: "Position",
                        prefixIcon: Icons.work,
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(
                          label: "salary", prefixIcon: Icons.attach_money),
                      const SizedBox(height: 10),

                      _buildTextField(
                        label: "Current Address",
                        prefixIcon: Icons.location_on,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildTextField(
                              label: "Permanent Address",
                              prefixIcon: Icons.home,
                              maxLines: 2,
                              enabled: !_sameAsCurrentAddress,
                            ),
                          ),
                          Column(
                            children: [
                              Checkbox(
                                value: _sameAsCurrentAddress,
                                onChanged: (value) {
                                  setState(() =>
                                      _sameAsCurrentAddress = value ?? false);
                                },
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "  Same as\nabove",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "LexendDecaRegular"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(
                        label: "Mobile Number",
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Upload Proof",
                            style: TextStyle(
                                fontSize: 16, fontFamily: "LexendDecaRegular"),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.upload_file,
                              color: Colors.blue,
                            ),
                            label: const Text(
                              "Choose File",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "LexendDecaRegular",
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade100,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Handle form submission
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "LexendDecaRegular"),
                        ),
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

  Widget _buildTextField({
    required String label,
    IconData? prefixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
    TextInputType? keyboardType,
    int maxLines = 1,
    bool enabled = true,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      cursorColor: Colors.blue,
      style: TextStyle(
        fontFamily: "LexendDecaRegular",
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            fontFamily: "LexendDecaRegular",
            color: const Color.fromARGB(255, 4, 98, 175)),
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: enabled
            ? const Color.fromARGB(255, 243, 247, 251)
            : Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      ),
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboardType,
      maxLines: maxLines,
      enabled: enabled,
      validator: validator,
    );
  }
}
