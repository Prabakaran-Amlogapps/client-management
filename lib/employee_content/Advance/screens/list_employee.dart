import 'package:employee_client_management/employee_content/Advance/screens/form_employee.dart';
import 'package:employee_client_management/models/EmployeePayment.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class EmployeePaymentList extends StatefulWidget {
  const EmployeePaymentList({Key? key}) : super(key: key);

  @override
  _EmployeePaymentListState createState() => _EmployeePaymentListState();
}

class _EmployeePaymentListState extends State<EmployeePaymentList> {
  List<EmployeePayment> _payments = [];
  List<EmployeePayment> _filteredPayments = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _subscribeToPayments();
    _searchController.addListener(_filterPayments);
  }

  void _subscribeToPayments() {
    Amplify.DataStore.observeQuery(EmployeePayment.classType)
        .listen((QuerySnapshot<EmployeePayment> snapshot) {
      setState(() {
        _payments = snapshot.items;
        _filterPayments();
        _isLoading = false;
      });
    });
  }

  void _filterPayments() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPayments = _payments.where((payment) {
        return payment.fullName.toLowerCase().contains(query) ||
            payment.position.toLowerCase().contains(query) ||
            payment.totalSalary.toString().contains(query) ||
            payment.currentSalary.toString().contains(query) ||
            payment.remainSalary.toString().contains(query);
      }).toList();
    });
  }

  Future<void> _deletePayment(EmployeePayment payment) async {
    try {
      await Amplify.DataStore.delete(payment);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment deleted successfully')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting payment: ${e.toString()}')),
      );
    }
  }

  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Delete',
                  style: TextStyle(fontFamily: "LexendDecaRegular")),
              content: const Text(
                  'Are you sure you want to delete this payment?',
                  style: TextStyle(fontFamily: "LexendDecaRegular")),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        ) ??
        false;
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
        title: const Text(
          'Advanced',
          style: TextStyle(fontFamily: "LexendDecaRegular"),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                //padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Employee...',
                        hintStyle: TextStyle(fontFamily: "LexendDecaRegular"),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _searchController.clear();
                                  _filterPayments();
                                },
                              )
                            : null,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmployeePaymentForm()));
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("Advanced",
                style: TextStyle(
                    fontFamily: "LexendDecaRegular",
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Divider(),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredPayments.isEmpty
                    ? Center(
                        child: Text(
                          _searchController.text.isEmpty
                              ? 'No payments found'
                              : 'No results found for "${_searchController.text}"',
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _filteredPayments.length,
                        itemBuilder: (context, index) {
                          final payment = _filteredPayments[index];
                          return Card(
                              color: const Color.fromARGB(255, 227, 229, 230),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(4),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            child: Text(payment.fullName[0]
                                                .toUpperCase()),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Text(payment.fullName,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "LexendDecaRegular",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(payment.position,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "LexendDecaRegular",
                                                        fontSize: 14))
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                              payment.date
                                                  .format()
                                                  .substring(0, 10),
                                              style: TextStyle(
                                                  fontFamily:
                                                      "LexendDecaRegular")),
                                          PopupMenuButton(
                                              onSelected: (String value) async {
                                                if (value == "edit") {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EmployeePaymentForm(
                                                              payment: payment),
                                                    ),
                                                  );
                                                } else if (value == "delete") {
                                                  if (await _confirmDelete(
                                                      context)) {
                                                    _deletePayment(payment);
                                                  }
                                                }
                                              },
                                              itemBuilder: (BuildContext
                                                      context) =>
                                                  [
                                                    PopupMenuItem(
                                                      value: "edit",
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.edit,
                                                              color:
                                                                  Colors.blue),
                                                          SizedBox(width: 10),
                                                          Text("Edit"),
                                                        ],
                                                      ),
                                                    ),
                                                    PopupMenuItem(
                                                      value: "delete",
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.delete,
                                                              color:
                                                                  Colors.red),
                                                          SizedBox(width: 10),
                                                          Text("Delete"),
                                                        ],
                                                      ),
                                                    ),
                                                  ])
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                              "Total Salary \n ${payment.totalSalary}",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "LexendDecaRegular",
                                                  fontSize: 12)),
                                          Text(
                                              "Current salary \n ${payment.currentSalary}",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "LexendDecaRegular",
                                                  fontSize: 12)),
                                          Text(
                                              "Remaining Salary \n${payment.remainSalary}",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "LexendDecaRegular",
                                                  fontSize: 12))
                                        ],
                                      )
                                    ],
                                  )));
                          // ListTile(
                          //   title: Text(
                          //     payment.fullName,
                          //     style: const TextStyle(
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          //   subtitle: Text(
                          //     'Position: ${payment.position}\n'
                          //     'Total: \$${payment.totalSalary.toStringAsFixed(2)}\n'
                          //     'Current: \$${payment.currentSalary.toStringAsFixed(2)}\n'
                          //     'Remain: \$${payment.remainSalary.toStringAsFixed(2)}',
                          //   ),
                          //   trailing: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     children: [
                          //       IconButton(
                          //         icon: const Icon(Icons.edit,
                          //             color: Colors.blue),
                          //         onPressed: () {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //               builder: (context) =>
                          //                   EmployeePaymentForm(
                          //                       payment: payment),
                          //             ),
                          //           );
                          //         },
                          //       ),
                          //       IconButton(
                          //         icon: const Icon(Icons.delete,
                          //             color: Colors.red),
                          //         onPressed: () async {
                          //           if (await _confirmDelete(context)) {
                          //             _deletePayment(payment);
                          //           }
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        },
                      ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const EmployeePaymentForm(),
      //       ),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
