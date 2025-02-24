import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:intl/intl.dart';

class Client extends Model {
  final String id;
  final String companyName;
  final String personName;
  final String position;
  final String contactNumber;
  final String email;
  final String address;
  final TemporalDateTime onboardDate;

  Client({
    required this.id,
    required this.companyName,
    required this.personName,
    required this.position,
    required this.contactNumber,
    required this.email,
    required this.address,
    required this.onboardDate,
  });

  // Helper method to convert TemporalDateTime to formatted string
  String getFormattedOnboardDate() {
    // Convert TemporalDateTime to DateTime for formatting
    final dateTime = DateTime.parse(onboardDate.toString());
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }
}
