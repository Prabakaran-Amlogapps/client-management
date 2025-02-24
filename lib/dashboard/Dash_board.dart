import 'package:employee_client_management/client_content/client.dart';
import 'package:employee_client_management/dashboard/Notepad/note_pad.dart';
import 'package:employee_client_management/dashboard/Notepad/notepad_backend_functions/notepadcard/notepadcards.dart';
import 'package:employee_client_management/dashboard/calander/calender_wid.dart';
import 'package:employee_client_management/dashboard/graphs/graph.dart';
import 'package:employee_client_management/employee_content/employee.dart';
import 'package:employee_client_management/profile/profile_page.dart';
import 'package:employee_client_management/support/support_page/support_pages.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// Keep existing imports...

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Helper method to determine if we're on a small screen
  bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust card width based on available space
        double cardWidth = constraints.maxWidth < 600
            ? (constraints.maxWidth / 2) - 24
            : // Small screen
            (constraints.maxWidth / 4) - 24; // Large screen

        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 100,
            width: cardWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 10, 24, 94),
                  Color.fromARGB(255, 28, 45, 128),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -20,
                  top: -20,
                  child: Icon(
                    icon,
                    size: 80,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: "LexendDecaRegular",
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              icon,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Text(
                            value,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: "LexendDecaRegular",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      },
                      child: Image.asset(
                        "icons/man_4140057.png",
                        height: 40,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              'Hello !',
                              style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "LexendDecaRegular"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "David",
                              style: TextStyle(
                                  fontFamily: "LexendDecaRegular",
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.settings,
                        size: 30,
                        color: const Color.fromARGB(255, 105, 103, 103),
                      ),
                      onTap: () {
                        // Navigation to settings page
                      },
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color: const Color.fromARGB(255, 255, 230, 4),
                      ),
                      onTap: () {
                        // Navigation to settings page
                      },
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.black),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isSmallScreen(context) ? 8.0 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: CalendarWidget(),
              ),
              DashboardNoteCard(),
              // Wrap stats in layouts that respond to screen size
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    // Stack cards vertically on small screens
                    return Column(
                      children: [
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildStatCard(
                              title: "Total Employee",
                              value: "10",
                              icon: Icons.group,
                            ),
                            _buildStatCard(
                              title: "Total Client",
                              value: "70",
                              icon: Icons.person_add,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildStatCard(
                              title: "On Leave",
                              value: "30",
                              icon: Icons.list_alt,
                            ),
                            _buildStatCard(
                              title: "Total Projects",
                              value: "90",
                              icon: Icons.task,
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    // Use a grid layout on larger screens
                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _buildStatCard(
                          title: "Total Employee",
                          value: "10",
                          icon: Icons.group,
                        ),
                        _buildStatCard(
                          title: "Total Client",
                          value: "70",
                          icon: Icons.person_add,
                        ),
                        _buildStatCard(
                          title: "On Leave",
                          value: "30",
                          icon: Icons.list_alt,
                        ),
                        _buildStatCard(
                          title: "Total Projects",
                          value: "90",
                          icon: Icons.task,
                        ),
                      ],
                    );
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                ),
                child: GraphWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// DashBoard class remains mostly the same, just adding responsive padding
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    Employees_pages_1(),
    ClientPage(),
    SupportPages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.blue,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, color: Colors.white),
              Text('Home',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          MediaQuery.of(context).size.width < 360 ? 8 : 10)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.people, color: Colors.white),
              Text('Employee',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          MediaQuery.of(context).size.width < 360 ? 8 : 10)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_outline, color: Colors.white),
              Text('Clients',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          MediaQuery.of(context).size.width < 360 ? 8 : 10)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.support_agent, color: Colors.white),
              Text('Support',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          MediaQuery.of(context).size.width < 360 ? 8 : 10)),
            ],
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
