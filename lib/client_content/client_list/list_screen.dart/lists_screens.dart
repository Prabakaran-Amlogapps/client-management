import 'package:employee_client_management/client_content/client_list/add_client/Add_client_details.dart';
import 'package:employee_client_management/client_content/client_list/services/services_client.dart';
import 'package:employee_client_management/models/Client.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({Key? key}) : super(key: key);

  @override
  _ClientListPageState createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  final ClientService _clientService = ClientService();
  List<Client> _clients = [];
  List<Client> _filteredClients = [];
  bool _isLoading = true;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadClients();
  }

  Future<void> _loadClients() async {
    setState(() => _isLoading = true);
    try {
      final clients = await _clientService.getAllClients();
      setState(() {
        _clients = clients;
        _filterClients();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading clients: $e')),
        );
      }
    }
  }

  void _filterClients() {
    if (_searchQuery.isEmpty) {
      _filteredClients = List.from(_clients);
    } else {
      _filteredClients = _clients.where((client) {
        final companyName = client.companyName?.toLowerCase() ?? '';
        final personName = client.personName?.toLowerCase() ?? '';
        final email = client.email?.toLowerCase() ?? '';
        final query = _searchQuery.toLowerCase();

        return companyName.contains(query) ||
            personName.contains(query) ||
            email.contains(query);
      }).toList();
    }
  }

  Future<void> _deleteClient(String? clientId) async {
    if (clientId == null) return;

    try {
      await _clientService.deleteClient(clientId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Client deleted successfully')),
        );
      }
      _loadClients();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting client: $e')),
        );
      }
    }
  }

  Future<void> _showDeleteConfirmation(Client client) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text(
              'Are you sure you want to delete ${client.companyName ?? 'this client'}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteClient(client.id);
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showClientDetails(Client client) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // change to alert dialog to container or card
          title: Text(client.companyName ?? 'Client Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _detailRow('Contact Person', client.personName),
                _detailRow('Position', client.position),
                _detailRow('Contact', client.contactNumber),
                _detailRow('Email', client.email),
                _detailRow('Address', client.address),
                _detailRow('Onboard Date', client.getFormattedOnboardDate()),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _detailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            value ?? 'Not provided',
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: const Text(
          'Client List',
          style: TextStyle(fontFamily: "LexendDecaRegular"),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                //     padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search clients...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                      _filterClients();
                    });
                  },
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
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Client List",
              style: TextStyle(
                  fontFamily: "LexendDecaRegular",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Divider(
              color: const Color.fromARGB(255, 28, 28, 28),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredClients.isEmpty
                    ? const Center(
                        child: Text('No clients found'),
                      )
                    : ListView.builder(
                        itemCount: _filteredClients.length,
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          final client = _filteredClients[index];
                          return Card(
                            elevation: 2,
                            margin: const EdgeInsets.only(bottom: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    child: Text(
                                        client.companyName[0].toUpperCase()),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        client.companyName ?? 'Unnamed Company',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(client.personName ??
                                          'No contact person'),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "icons/pngegg.png",
                                    color: Colors.green,
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.message,
                                    color: Colors.blue,
                                  ),
                                  PopupMenuButton(
                                    onSelected: (String value) {
                                      if (value == "edit") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddClientDetails(
                                              clientToEdit: client,
                                            ),
                                          ),
                                        ).then((_) => _loadClients());
                                      } else if (value == "delete") {
                                        _showDeleteConfirmation(client);
                                      }
                                    },
                                    itemBuilder: (BuildContext contect) => [
                                      PopupMenuItem(
                                        value: "edit",
                                        child: Row(
                                          children: [
                                            Icon(Icons.edit,
                                                color: Colors.blue),
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
                                                color: Colors.red),
                                            SizedBox(width: 10),
                                            Text("Delete"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // child: ListTile(
                            //   contentPadding: const EdgeInsets.all(16),
                            //   title: Text(
                            //     client.companyName ?? 'Unnamed Company',
                            //     style: const TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 18,
                            //     ),
                            //   ),
                            //   subtitle: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       const SizedBox(height: 8),
                            //       Text(
                            //           client.personName ?? 'No contact person'),
                            //       Text(client.email ?? 'No email provided'),
                            //     ],
                            //   ),
                            //   trailing: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       IconButton(
                            //         icon: const Icon(Icons.visibility),
                            //         onPressed: () => _showClientDetails(client),
                            //         color: Colors.blue,
                            //       ),
                            //       IconButton(
                            //         icon: const Icon(Icons.edit),
                            //         onPressed: () {
                            //           Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //               builder: (context) =>
                            //                   AddClientDetails(
                            //                 clientToEdit: client,
                            //               ),
                            //             ),
                            //           ).then((_) => _loadClients());
                            //         },
                            //         color: Colors.green,
                            //       ),
                            //       IconButton(
                            //         icon: const Icon(Icons.delete),
                            //         onPressed: () =>
                            //             _showDeleteConfirmation(client),
                            //         color: Colors.red,
                            //       ),
                            //     ],
                            //   ),
                            //   onTap: () => _showClientDetails(client),
                            // ),
                          );
                        },
                      ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const AddClientDetails()),
      //     ).then((_) => _loadClients());
      //   },
      //   child: const Icon(Icons.add),
      //   backgroundColor: Colors.blue,
      // ),
    );
  }
}
