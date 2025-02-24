import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:employee_client_management/models/PaymentDetails.dart';

class PaymentService {
  // Create payment
  Future<void> createPayment(PaymentDetails payment) async {
    try {
      await Amplify.DataStore.save(payment);
    } catch (e) {
      print('Error creating payment: $e');
      rethrow;
    }
  }

  // Read all payments
  Future<List<PaymentDetails>> getAllPayments() async {
    try {
      return await Amplify.DataStore.query(PaymentDetails.classType);
    } catch (e) {
      print('Error fetching payments: $e');
      rethrow;
    }
  }

  // Update payment
  Future<void> updatePayment(PaymentDetails payment) async {
    try {
      await Amplify.DataStore.save(payment);
    } catch (e) {
      print('Error updating payment: $e');
      rethrow;
    }
  }

  // Delete payment
  Future<void> deletePayment(PaymentDetails payment) async {
    try {
      await Amplify.DataStore.delete(payment);
    } catch (e) {
      print('Error deleting payment: $e');
      rethrow;
    }
  }
}
