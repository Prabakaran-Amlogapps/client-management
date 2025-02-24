import 'package:employee_client_management/client_content/payment_pending/add_payment_pending/addPayment_pending.dart';
import 'package:employee_client_management/client_content/payment_pending/screens/list_screen.dart';
import 'package:employee_client_management/dashboard/calander/calender_wid.dart';
import 'package:flutter/material.dart';

class Payment_pending_1 extends StatefulWidget {
  const Payment_pending_1({super.key});

  @override
  State<Payment_pending_1> createState() => _Payment_pending_1State();
}

class _Payment_pending_1State extends State<Payment_pending_1> {
  String searchText = '';
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  // Add dropdown value
  String _selectedPaymentType = 'Full Payment';
  final List<String> _paymentTypes = [
    'Full Payment',
    'Partial Payment',
    'Installment',
    'Advance Payment'
  ];

  @override
  void dispose() {
    _searchController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          "Payment Pendings",
          style: TextStyle(
            color: Colors.black87,
            fontFamily: "LexendDecaRegular",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Previous search bar code remains the same
            Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 1),
                        )
                      ]),
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(
                        fontFamily: "LexendDecaRegular", fontSize: 16),
                    cursorColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search pending",
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
                      fillColor: const Color.fromARGB(255, 224, 220, 220),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentListScreen()));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            SizedBox(height: 10),
            // Title section remains the same
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Payment Pending List",
                style: TextStyle(
                    fontFamily: "LexendDecaRegular",
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 16),
            // Updated Card with Dropdown
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 238, 250),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    // Previous header section remains the same
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "icons/man_4140057.png",
                            height: 35,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Company name',
                                  style: TextStyle(
                                    fontFamily: "LexendDecaRegular",
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Project Name',
                                  style: TextStyle(
                                    fontFamily: "LexendDecaRegular",
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Status: ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "LexendDecaRegular",
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 25,
                                    child: TextField(
                                      controller: _statusController,
                                      style: TextStyle(fontSize: 12),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Billed Date",
                                style: TextStyle(
                                  fontFamily: "LexendDecaRegular",
                                  fontSize: 12,
                                ),
                              ),
                              CalendarDateWidget(fontSize: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // New Dropdown section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Type",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "LexendDecaRegular",
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: DropdownButton<String>(
                                    value: _selectedPaymentType,
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    items: _paymentTypes.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "LexendDecaRegular",
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        setState(() {
                                          _selectedPaymentType = newValue;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    // Amount fields
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Amount",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(height: 4),
                                SizedBox(
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pending Amount",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(height: 4),
                                SizedBox(
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 24,
                      indent: 16,
                      endIndent: 16,
                    ),
                    // Footer section remains the same
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "50,000",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CalendarDateWidget(fontSize: 10),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
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
            ),
            // ListView remains unchanged
            Expanded(
              child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                    child: const ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        "Employee Name",
                        style: TextStyle(
                          fontFamily: "LexendDecaRegular",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        "Position",
                        style: TextStyle(
                          fontFamily: "LexendDecaRegular",
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
