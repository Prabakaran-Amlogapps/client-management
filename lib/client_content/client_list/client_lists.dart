import 'package:employee_client_management/client_content/client_list/add_client/Add_client_details.dart';
import 'package:flutter/material.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  String searchText = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: Text(
          "Client List",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "LexendDecaRegular",
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 218, 214, 214)
                              .withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(
                        fontFamily: "LexendDecaRegular",
                        fontSize: 16,
                      ),
                      cursorColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Client',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: "LexendDecaRegular",
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 223, 220, 220),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddClientDetails()));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                "Client List",
                style: TextStyle(
                  fontFamily: "LexendDecaRegular",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Divider(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.white,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 246, 246),
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
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        child:
                            Icon(Icons.person_2_outlined, color: Colors.blue),
                      ),
                      const SizedBox(width: 10),
                      Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John david',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "LexendDecaRegular",
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Automotive Manufacturing',
                            style: TextStyle(
                              fontFamily: "LexendDecaRegular",
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )),
                      Spacer(),
                      GestureDetector(
                          child: Container(
                              margin: EdgeInsets.all(13),
                              child: Image.asset(
                                // whatsapp icon
                                "icons/pngegg.png",
                                height: 28,
                                color: Colors.green,
                              ))),
                      GestureDetector(
                          child: Container(
                        margin: EdgeInsets.only(right: 13),
                        child: Icon(Icons.call, color: Colors.blue),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
