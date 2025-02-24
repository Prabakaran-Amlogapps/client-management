import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditingMode = false;

  final Map<String, TextEditingController> controllers = {
    'name': TextEditingController(text: 'David Johnson'),
    'company': TextEditingController(text: 'Tech Innovations Inc.'),
    'industry': TextEditingController(text: 'Information Technology'),
    'employees': TextEditingController(text: '100-500'),
    'address': TextEditingController(text: '123 Innovation Street, Tech City'),
    'contact': TextEditingController(text: '+91 00000 00000'),
    'email': TextEditingController(text: 'david.@techinnovations.com'),
  };

  final List<String> industries = [
    "Agriculture",
    "Mining and Quarrying",
    "Energy Production",
    "Automotive Manufacturing",
    "Aerospace Manufacturing",
    "Electronics Manufacturing",
    "Pharmaceutical Manufacturing",
    "Chemical Manufacturing",
    "Textiles and Apparel",
    "Food and Beverage Processing",
    "Construction and Infrastructure",
    "Steel and Metalworking",
    "Healthcare and Pharmaceuticals",
    "Education and Training",
    "Finance and Banking",
    "Information Technology (IT)",
    "Tourism and Hospitality",
    "Retail and E-Commerce",
    "Media and Entertainment",
    "Transportation and Logistics",
    "Research and Development (R&D)",
    "AI and Machine Learning",
    "Data Analytics and Big Data",
    "Consulting Services",
    "Legal and Professional Services",
    "Government and Public Administration",
    "Non-Governmental Organizations (NGOs)",
    "Policy and Strategic Management",
    "Green Technology and Sustainability",
    "Space Exploration and Satellite Services",
    "Biotechnology",
    "Blockchain and Cryptocurrency",
    "Robotics and Automation",
    "Metaverse and Virtual Reality",
    "Real Estate and Urban Development",
    "Telecommunications",
    "Insurance",
    "Food and Agriculture Technology (AgriTech)",
  ];

  @override
  void dispose() {
    controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  void _saveChanges() {
    setState(() {
      isEditingMode = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All changes saved successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "LexendDecaRegular",
          ),
        ),
        actions: [
          if (!isEditingMode)
            Row(
              children: [
                TextButton(
                  onPressed: () => setState(() => isEditingMode = true),
                  child: Text(
                    "Edit",
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "LexendDecaRegular",
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ],
            )
          else
            Row(
              children: [
                TextButton(
                  child: Text("Save  ",
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: "LexendDecaRegular",
                          fontWeight: FontWeight.bold)),
                  onPressed: _saveChanges,
                ),
              ],
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              SizedBox(height: 6),
              _buildInfoCard(
                icon: Icons.person,
                title: 'Name',
                field: 'name',
              ),
              SizedBox(height: 6),
              _buildInfoCard(
                icon: Icons.location_city_outlined,
                title: 'Company',
                field: 'company',
              ),
              SizedBox(height: 6),
              _buildIndustryCard(),
              SizedBox(height: 6),
              _buildInfoCard(
                icon: Icons.people,
                title: 'Number of Employees',
                field: 'employees',
              ),
              SizedBox(height: 6),
              _buildInfoCard(
                icon: Icons.location_on,
                title: 'Address',
                field: 'address',
              ),
              SizedBox(height: 6),
              _buildInfoCard(
                icon: Icons.phone_android,
                title: 'Contact',
                field: 'contact',
              ),
              SizedBox(height: 6),
              _buildInfoCard(
                icon: Icons.email,
                title: 'Email',
                field: 'email',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String field,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.blue, size: 20),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: "LexendDecaRegular",
            fontSize: 14,
          ),
        ),
        subtitle: isEditingMode
            ? TextField(
                controller: controllers[field],
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "LexendDecaRegular",
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
              )
            : Text(
                controllers[field]?.text ?? '',
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "LexendDecaRegular",
                ),
              ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('icons/man_4140057.png'),
            ),
            if (isEditingMode)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.camera_alt, color: Colors.white),
                ),
              ),
          ],
        ));
  }

  Widget _buildIndustryCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.business, color: Colors.blue, size: 20),
        ),
        title: Text(
          'Industry',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: "LexendDecaRegular",
            fontSize: 14,
          ),
        ),
        subtitle: isEditingMode
            ? Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controllers['industry'],
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: "LexendDecaRegular",
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () => _showIndustryDialog(),
                  ),
                ],
              )
            : Text(
                controllers['industry']?.text ?? '',
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "LexendDecaRegular",
                ),
              ),
      ),
    );
  }

  void _showIndustryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Select Industry",
            style: TextStyle(fontFamily: "LexendDecaRegular"),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: industries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    industries[index],
                    style: TextStyle(fontFamily: "LexendDecaRegular"),
                  ),
                  onTap: () {
                    setState(() {
                      controllers['industry']?.text = industries[index];
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Close",
                style: TextStyle(fontFamily: "LexendDecaRegular"),
              ),
            ),
          ],
        );
      },
    );
  }
}
