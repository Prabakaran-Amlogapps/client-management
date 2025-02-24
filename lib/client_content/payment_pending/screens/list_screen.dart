import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:employee_client_management/client_content/payment_pending/services/services_payment.dart';
import 'package:employee_client_management/dashboard/calander/calender_wid.dart';
import 'package:employee_client_management/models/PaymentDetails.dart';
import 'package:flutter/material.dart';

class PaymentListScreen extends StatefulWidget {
  @override
  _PaymentListScreenState createState() => _PaymentListScreenState();
}

class _PaymentListScreenState extends State<PaymentListScreen> {
  final PaymentService _paymentService = PaymentService();
  List<PaymentDetails> _payments = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPayments();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadPayments() async {
    final payments = await _paymentService.getAllPayments();
    setState(() {
      _payments = payments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Payment Details',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "LexendDeca",
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search payments...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _payments.length,
              itemBuilder: (context, index) {
                final payment = _payments[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                "icons/man_4140057.png",
                                height: 40,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    payment.projectName,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "LexendDecaRegular",
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        payment.clientName,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontFamily: "LexendDecaRegular",
                                        ),
                                      ),
                                      Spacer(),
                                      CalendarDateWidget(fontSize: 10),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildAmountColumn(
                                "Total Amount",
                                '\$${payment.totalAmount}',
                                Colors.blue[700]!,
                              ),
                              _buildAmountColumn(
                                "Pending",
                                '\$${payment.pendingAmount}',
                                Colors.orange[700]!,
                              ),
                              _buildAmountColumn(
                                "Received",
                                '\$${payment.receivedAmount}',
                                Colors.green[700]!,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _buildAmountColumn(
                              "Date",
                              '${payment.date.format().substring(0, 10)}',
                              Colors.blue,
                            ),
                            Spacer(),
                            _buildActionButton(
                              "Edit",
                              Icons.edit_outlined,
                              Colors.blue[700]!,
                              () => _showPaymentDialog(payment),
                            ),
                            SizedBox(width: 12),
                            _buildActionButton(
                              "Delete",
                              Icons.delete_outline,
                              Colors.red[700]!,
                              () => _deletePayment(payment),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showPaymentDialog(null),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          'Add Payment',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "LexendDecaRegular",
          ),
        ),
        backgroundColor: Colors.blue[700],
      ),
    );
  }

  Widget _buildAmountColumn(String label, String amount, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontFamily: "LexendDecaRegular",
          ),
        ),
        SizedBox(height: 4),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
            fontFamily: "LexendDecaRegular",
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
      String label, IconData icon, Color color, VoidCallback onPressed) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color, size: 20),
      label: Text(
        label,
        style: TextStyle(
          color: color,
          fontFamily: "LexendDecaRegular",
          fontSize: 14,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }

  Future<void> _showPaymentDialog(PaymentDetails? payment) async {
    final isEditing = payment != null;
    final projectController = TextEditingController(text: payment?.projectName);
    final clientController = TextEditingController(text: payment?.clientName);
    final totalController =
        TextEditingController(text: payment?.totalAmount?.toString() ?? '');
    final pendingController =
        TextEditingController(text: payment?.pendingAmount?.toString() ?? '');
    final receivedController =
        TextEditingController(text: payment?.receivedAmount?.toString() ?? '');
    DateTime? selectedDate =
        payment?.date?.getDateTimeInUtc() ?? DateTime.now();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          isEditing ? 'Edit Payment' : 'Add Payment',
          style: TextStyle(
            fontFamily: "LexendDecaRegular",
            fontWeight: FontWeight.w600,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(
                controller: projectController,
                label: 'Project Name',
                icon: Icons.work_outline,
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: clientController,
                label: 'Client Name',
                icon: Icons.person_outline,
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: totalController,
                label: 'Total Amount',
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: pendingController,
                label: 'Pending Amount',
                icon: Icons.pending_actions,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: receivedController,
                label: 'Received Amount',
                icon: Icons.check_circle_outline,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    selectedDate = picked;
                  }
                },
                icon: Icon(Icons.calendar_today),
                label: Text('Select Date'),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final newPayment = PaymentDetails(
                id: payment?.id ?? UUID.getUUID(),
                projectName: projectController.text,
                clientName: clientController.text,
                totalAmount: double.parse(totalController.text),
                pendingAmount: double.parse(pendingController.text),
                receivedAmount: double.parse(receivedController.text),
                date: TemporalDateTime(selectedDate!),
              );

              if (isEditing) {
                await _paymentService.updatePayment(newPayment);
              } else {
                await _paymentService.createPayment(newPayment);
              }

              Navigator.pop(context);
              _loadPayments();
            },
            child: Text('Save'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 22),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Future<void> _deletePayment(PaymentDetails payment) async {
    await _paymentService.deletePayment(payment);
    _loadPayments();
  }
}
