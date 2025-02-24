import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';

@immutable
class Employee implements Model {
  static const classType = ModelType(Employee);
  final String id;
  final String name;
  String? image;
  final DateTime dateOfJoining;
  final String gender;
  final String position;
  final double salary;
  final String currentAddress;
  final String permanentAddress;
  final bool sameAsAbove;
  final String mobileNumber;
  String? proofDocument;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Employee({
    required this.id,
    required this.name,
    this.image,
    required this.dateOfJoining,
    required this.gender,
    required this.position,
    required this.salary,
    required this.currentAddress,
    required this.permanentAddress,
    required this.sameAsAbove,
    required this.mobileNumber,
    this.proofDocument,
    this.createdAt,
    this.updatedAt,
  });

  @override
  ModelType getInstanceType() => classType;

  @override
  String getId() => id;

  @override
  String? resolveIdentifier() => id;

  Employee copyWith({
    String? id,
    String? name,
    String? image,
    DateTime? dateOfJoining,
    String? gender,
    String? position,
    double? salary,
    String? currentAddress,
    String? permanentAddress,
    bool? sameAsAbove,
    String? mobileNumber,
    String? proofDocument,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Employee(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      dateOfJoining: dateOfJoining ?? this.dateOfJoining,
      gender: gender ?? this.gender,
      position: position ?? this.position,
      salary: salary ?? this.salary,
      currentAddress: currentAddress ?? this.currentAddress,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      sameAsAbove: sameAsAbove ?? this.sameAsAbove,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      proofDocument: proofDocument ?? this.proofDocument,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        dateOfJoining,
        gender,
        position,
        salary,
        currentAddress,
        permanentAddress,
        sameAsAbove,
        mobileNumber,
        proofDocument,
        createdAt,
        updatedAt,
      ];

  static Employee fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      dateOfJoining: DateTime.parse(json['dateOfJoining'] as String),
      gender: json['gender'] as String,
      position: json['position'] as String,
      salary: (json['salary'] as num).toDouble(),
      currentAddress: json['currentAddress'] as String,
      permanentAddress: json['permanentAddress'] as String,
      sameAsAbove: json['sameAsAbove'] as bool,
      mobileNumber: json['mobileNumber'] as String,
      proofDocument: json['proofDocument'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'dateOfJoining': dateOfJoining.toIso8601String(),
      'gender': gender,
      'position': position,
      'salary': salary,
      'currentAddress': currentAddress,
      'permanentAddress': permanentAddress,
      'sameAsAbove': sameAsAbove,
      'mobileNumber': mobileNumber,
      'proofDocument': proofDocument,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}