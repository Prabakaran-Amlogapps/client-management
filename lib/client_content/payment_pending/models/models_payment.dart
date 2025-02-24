import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

@immutable
class PaymentDetails extends Model {
  final String id;
  final String projectName;
  final String clientName;
  final double totalAmount;
  final double pendingAmount;
  final double receivedAmount;
  final DateTime date;

  PaymentDetails({
    required this.id,
    required this.projectName,
    required this.clientName,
    required this.totalAmount,
    required this.pendingAmount,
    required this.receivedAmount,
    required this.date,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectName': projectName,
      'clientName': clientName,
      'totalAmount': totalAmount,
      'pendingAmount': pendingAmount,
      'receivedAmount': receivedAmount,
      'date': TemporalDateTime(date),
    };
  }

  static PaymentDetails fromMap(Map<String, dynamic> map) {
    return PaymentDetails(
      id: map['id'],
      projectName: map['projectName'],
      clientName: map['clientName'],
      totalAmount: map['totalAmount'],
      pendingAmount: map['pendingAmount'],
      receivedAmount: map['receivedAmount'],
      date: (map['date'] as TemporalDateTime).toDateTime(),
    );
  }

  static List<dynamic> fromJson(json) {
    if (json is List) {
      return json.map((item) => PaymentDetails.fromMap(item)).toList();
    } else {
      throw Exception('Invalid JSON format');
    }
  }
}

extension on TemporalDateTime {
  toDateTime() {}
}
