/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Employee type in your schema. */
class Employee extends amplify_core.Model {
  static const classType = const _EmployeeModelType();
  final String id;
  final String? _fullName;
  final String? _gender;
  final String? _position;
  final double? _salary;
  final String? _currentAddress;
  final String? _permanentAddress;
  final bool? _sameAsCurrent;
  final String? _mobileNumber;
  final String? _profileImage;
  final String? _proofDocument;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EmployeeModelIdentifier get modelIdentifier {
      return EmployeeModelIdentifier(
        id: id
      );
  }
  
  String get fullName {
    try {
      return _fullName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get gender {
    try {
      return _gender!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get position {
    try {
      return _position!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get salary {
    try {
      return _salary!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get currentAddress {
    try {
      return _currentAddress!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get permanentAddress {
    return _permanentAddress;
  }
  
  bool? get sameAsCurrent {
    return _sameAsCurrent;
  }
  
  String get mobileNumber {
    try {
      return _mobileNumber!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get profileImage {
    return _profileImage;
  }
  
  String? get proofDocument {
    return _proofDocument;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Employee._internal({required this.id, required fullName, required gender, required position, required salary, required currentAddress, permanentAddress, sameAsCurrent, required mobileNumber, profileImage, proofDocument, createdAt, updatedAt}): _fullName = fullName, _gender = gender, _position = position, _salary = salary, _currentAddress = currentAddress, _permanentAddress = permanentAddress, _sameAsCurrent = sameAsCurrent, _mobileNumber = mobileNumber, _profileImage = profileImage, _proofDocument = proofDocument, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Employee({String? id, required String fullName, required String gender, required String position, required double salary, required String currentAddress, String? permanentAddress, bool? sameAsCurrent, required String mobileNumber, String? profileImage, String? proofDocument}) {
    return Employee._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      fullName: fullName,
      gender: gender,
      position: position,
      salary: salary,
      currentAddress: currentAddress,
      permanentAddress: permanentAddress,
      sameAsCurrent: sameAsCurrent,
      mobileNumber: mobileNumber,
      profileImage: profileImage,
      proofDocument: proofDocument);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Employee &&
      id == other.id &&
      _fullName == other._fullName &&
      _gender == other._gender &&
      _position == other._position &&
      _salary == other._salary &&
      _currentAddress == other._currentAddress &&
      _permanentAddress == other._permanentAddress &&
      _sameAsCurrent == other._sameAsCurrent &&
      _mobileNumber == other._mobileNumber &&
      _profileImage == other._profileImage &&
      _proofDocument == other._proofDocument;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Employee {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("fullName=" + "$_fullName" + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("position=" + "$_position" + ", ");
    buffer.write("salary=" + (_salary != null ? _salary!.toString() : "null") + ", ");
    buffer.write("currentAddress=" + "$_currentAddress" + ", ");
    buffer.write("permanentAddress=" + "$_permanentAddress" + ", ");
    buffer.write("sameAsCurrent=" + (_sameAsCurrent != null ? _sameAsCurrent!.toString() : "null") + ", ");
    buffer.write("mobileNumber=" + "$_mobileNumber" + ", ");
    buffer.write("profileImage=" + "$_profileImage" + ", ");
    buffer.write("proofDocument=" + "$_proofDocument" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Employee copyWith({String? fullName, String? gender, String? position, double? salary, String? currentAddress, String? permanentAddress, bool? sameAsCurrent, String? mobileNumber, String? profileImage, String? proofDocument}) {
    return Employee._internal(
      id: id,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      position: position ?? this.position,
      salary: salary ?? this.salary,
      currentAddress: currentAddress ?? this.currentAddress,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      sameAsCurrent: sameAsCurrent ?? this.sameAsCurrent,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      profileImage: profileImage ?? this.profileImage,
      proofDocument: proofDocument ?? this.proofDocument);
  }
  
  Employee copyWithModelFieldValues({
    ModelFieldValue<String>? fullName,
    ModelFieldValue<String>? gender,
    ModelFieldValue<String>? position,
    ModelFieldValue<double>? salary,
    ModelFieldValue<String>? currentAddress,
    ModelFieldValue<String?>? permanentAddress,
    ModelFieldValue<bool?>? sameAsCurrent,
    ModelFieldValue<String>? mobileNumber,
    ModelFieldValue<String?>? profileImage,
    ModelFieldValue<String?>? proofDocument
  }) {
    return Employee._internal(
      id: id,
      fullName: fullName == null ? this.fullName : fullName.value,
      gender: gender == null ? this.gender : gender.value,
      position: position == null ? this.position : position.value,
      salary: salary == null ? this.salary : salary.value,
      currentAddress: currentAddress == null ? this.currentAddress : currentAddress.value,
      permanentAddress: permanentAddress == null ? this.permanentAddress : permanentAddress.value,
      sameAsCurrent: sameAsCurrent == null ? this.sameAsCurrent : sameAsCurrent.value,
      mobileNumber: mobileNumber == null ? this.mobileNumber : mobileNumber.value,
      profileImage: profileImage == null ? this.profileImage : profileImage.value,
      proofDocument: proofDocument == null ? this.proofDocument : proofDocument.value
    );
  }
  
  Employee.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _fullName = json['fullName'],
      _gender = json['gender'],
      _position = json['position'],
      _salary = (json['salary'] as num?)?.toDouble(),
      _currentAddress = json['currentAddress'],
      _permanentAddress = json['permanentAddress'],
      _sameAsCurrent = json['sameAsCurrent'],
      _mobileNumber = json['mobileNumber'],
      _profileImage = json['profileImage'],
      _proofDocument = json['proofDocument'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'fullName': _fullName, 'gender': _gender, 'position': _position, 'salary': _salary, 'currentAddress': _currentAddress, 'permanentAddress': _permanentAddress, 'sameAsCurrent': _sameAsCurrent, 'mobileNumber': _mobileNumber, 'profileImage': _profileImage, 'proofDocument': _proofDocument, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'fullName': _fullName,
    'gender': _gender,
    'position': _position,
    'salary': _salary,
    'currentAddress': _currentAddress,
    'permanentAddress': _permanentAddress,
    'sameAsCurrent': _sameAsCurrent,
    'mobileNumber': _mobileNumber,
    'profileImage': _profileImage,
    'proofDocument': _proofDocument,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EmployeeModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EmployeeModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FULLNAME = amplify_core.QueryField(fieldName: "fullName");
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static final POSITION = amplify_core.QueryField(fieldName: "position");
  static final SALARY = amplify_core.QueryField(fieldName: "salary");
  static final CURRENTADDRESS = amplify_core.QueryField(fieldName: "currentAddress");
  static final PERMANENTADDRESS = amplify_core.QueryField(fieldName: "permanentAddress");
  static final SAMEASCURRENT = amplify_core.QueryField(fieldName: "sameAsCurrent");
  static final MOBILENUMBER = amplify_core.QueryField(fieldName: "mobileNumber");
  static final PROFILEIMAGE = amplify_core.QueryField(fieldName: "profileImage");
  static final PROOFDOCUMENT = amplify_core.QueryField(fieldName: "proofDocument");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Employee";
    modelSchemaDefinition.pluralName = "Employees";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.FULLNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.GENDER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.POSITION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.SALARY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.CURRENTADDRESS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.PERMANENTADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.SAMEASCURRENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.MOBILENUMBER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.PROFILEIMAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.PROOFDOCUMENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _EmployeeModelType extends amplify_core.ModelType<Employee> {
  const _EmployeeModelType();
  
  @override
  Employee fromJson(Map<String, dynamic> jsonData) {
    return Employee.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Employee';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Employee] in your schema.
 */
class EmployeeModelIdentifier implements amplify_core.ModelIdentifier<Employee> {
  final String id;

  /** Create an instance of EmployeeModelIdentifier using [id] the primary key. */
  const EmployeeModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'EmployeeModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EmployeeModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}