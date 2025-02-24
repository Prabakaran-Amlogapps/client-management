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


/** This is an auto generated class representing the EmployeePayment type in your schema. */
class EmployeePayment extends amplify_core.Model {
  static const classType = const _EmployeePaymentModelType();
  final String id;
  final String? _fullName;
  final amplify_core.TemporalDateTime? _date;
  final double? _totalSalary;
  final double? _currentSalary;
  final double? _remainSalary;
  final String? _position;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EmployeePaymentModelIdentifier get modelIdentifier {
      return EmployeePaymentModelIdentifier(
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
  
  amplify_core.TemporalDateTime get date {
    try {
      return _date!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get totalSalary {
    try {
      return _totalSalary!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get currentSalary {
    try {
      return _currentSalary!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get remainSalary {
    try {
      return _remainSalary!;
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EmployeePayment._internal({required this.id, required fullName, required date, required totalSalary, required currentSalary, required remainSalary, required position, createdAt, updatedAt}): _fullName = fullName, _date = date, _totalSalary = totalSalary, _currentSalary = currentSalary, _remainSalary = remainSalary, _position = position, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EmployeePayment({String? id, required String fullName, required amplify_core.TemporalDateTime date, required double totalSalary, required double currentSalary, required double remainSalary, required String position}) {
    return EmployeePayment._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      fullName: fullName,
      date: date,
      totalSalary: totalSalary,
      currentSalary: currentSalary,
      remainSalary: remainSalary,
      position: position);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmployeePayment &&
      id == other.id &&
      _fullName == other._fullName &&
      _date == other._date &&
      _totalSalary == other._totalSalary &&
      _currentSalary == other._currentSalary &&
      _remainSalary == other._remainSalary &&
      _position == other._position;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EmployeePayment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("fullName=" + "$_fullName" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("totalSalary=" + (_totalSalary != null ? _totalSalary!.toString() : "null") + ", ");
    buffer.write("currentSalary=" + (_currentSalary != null ? _currentSalary!.toString() : "null") + ", ");
    buffer.write("remainSalary=" + (_remainSalary != null ? _remainSalary!.toString() : "null") + ", ");
    buffer.write("position=" + "$_position" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EmployeePayment copyWith({String? fullName, amplify_core.TemporalDateTime? date, double? totalSalary, double? currentSalary, double? remainSalary, String? position}) {
    return EmployeePayment._internal(
      id: id,
      fullName: fullName ?? this.fullName,
      date: date ?? this.date,
      totalSalary: totalSalary ?? this.totalSalary,
      currentSalary: currentSalary ?? this.currentSalary,
      remainSalary: remainSalary ?? this.remainSalary,
      position: position ?? this.position);
  }
  
  EmployeePayment copyWithModelFieldValues({
    ModelFieldValue<String>? fullName,
    ModelFieldValue<amplify_core.TemporalDateTime>? date,
    ModelFieldValue<double>? totalSalary,
    ModelFieldValue<double>? currentSalary,
    ModelFieldValue<double>? remainSalary,
    ModelFieldValue<String>? position
  }) {
    return EmployeePayment._internal(
      id: id,
      fullName: fullName == null ? this.fullName : fullName.value,
      date: date == null ? this.date : date.value,
      totalSalary: totalSalary == null ? this.totalSalary : totalSalary.value,
      currentSalary: currentSalary == null ? this.currentSalary : currentSalary.value,
      remainSalary: remainSalary == null ? this.remainSalary : remainSalary.value,
      position: position == null ? this.position : position.value
    );
  }
  
  EmployeePayment.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _fullName = json['fullName'],
      _date = json['date'] != null ? amplify_core.TemporalDateTime.fromString(json['date']) : null,
      _totalSalary = (json['totalSalary'] as num?)?.toDouble(),
      _currentSalary = (json['currentSalary'] as num?)?.toDouble(),
      _remainSalary = (json['remainSalary'] as num?)?.toDouble(),
      _position = json['position'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'fullName': _fullName, 'date': _date?.format(), 'totalSalary': _totalSalary, 'currentSalary': _currentSalary, 'remainSalary': _remainSalary, 'position': _position, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'fullName': _fullName,
    'date': _date,
    'totalSalary': _totalSalary,
    'currentSalary': _currentSalary,
    'remainSalary': _remainSalary,
    'position': _position,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EmployeePaymentModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EmployeePaymentModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FULLNAME = amplify_core.QueryField(fieldName: "fullName");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final TOTALSALARY = amplify_core.QueryField(fieldName: "totalSalary");
  static final CURRENTSALARY = amplify_core.QueryField(fieldName: "currentSalary");
  static final REMAINSALARY = amplify_core.QueryField(fieldName: "remainSalary");
  static final POSITION = amplify_core.QueryField(fieldName: "position");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EmployeePayment";
    modelSchemaDefinition.pluralName = "EmployeePayments";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmployeePayment.FULLNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmployeePayment.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmployeePayment.TOTALSALARY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmployeePayment.CURRENTSALARY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmployeePayment.REMAINSALARY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmployeePayment.POSITION,
      isRequired: true,
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

class _EmployeePaymentModelType extends amplify_core.ModelType<EmployeePayment> {
  const _EmployeePaymentModelType();
  
  @override
  EmployeePayment fromJson(Map<String, dynamic> jsonData) {
    return EmployeePayment.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EmployeePayment';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EmployeePayment] in your schema.
 */
class EmployeePaymentModelIdentifier implements amplify_core.ModelIdentifier<EmployeePayment> {
  final String id;

  /** Create an instance of EmployeePaymentModelIdentifier using [id] the primary key. */
  const EmployeePaymentModelIdentifier({
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
  String toString() => 'EmployeePaymentModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EmployeePaymentModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}