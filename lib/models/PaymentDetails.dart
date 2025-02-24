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


/** This is an auto generated class representing the PaymentDetails type in your schema. */
class PaymentDetails extends amplify_core.Model {
  static const classType = const _PaymentDetailsModelType();
  final String id;
  final String? _projectName;
  final String? _clientName;
  final double? _totalAmount;
  final double? _pendingAmount;
  final double? _receivedAmount;
  final amplify_core.TemporalDateTime? _date;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PaymentDetailsModelIdentifier get modelIdentifier {
      return PaymentDetailsModelIdentifier(
        id: id
      );
  }
  
  String get projectName {
    try {
      return _projectName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get clientName {
    try {
      return _clientName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get totalAmount {
    try {
      return _totalAmount!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get pendingAmount {
    try {
      return _pendingAmount!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get receivedAmount {
    try {
      return _receivedAmount!;
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const PaymentDetails._internal({required this.id, required projectName, required clientName, required totalAmount, required pendingAmount, required receivedAmount, required date, createdAt, updatedAt}): _projectName = projectName, _clientName = clientName, _totalAmount = totalAmount, _pendingAmount = pendingAmount, _receivedAmount = receivedAmount, _date = date, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory PaymentDetails({String? id, required String projectName, required String clientName, required double totalAmount, required double pendingAmount, required double receivedAmount, required amplify_core.TemporalDateTime date}) {
    return PaymentDetails._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      projectName: projectName,
      clientName: clientName,
      totalAmount: totalAmount,
      pendingAmount: pendingAmount,
      receivedAmount: receivedAmount,
      date: date);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentDetails &&
      id == other.id &&
      _projectName == other._projectName &&
      _clientName == other._clientName &&
      _totalAmount == other._totalAmount &&
      _pendingAmount == other._pendingAmount &&
      _receivedAmount == other._receivedAmount &&
      _date == other._date;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PaymentDetails {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("projectName=" + "$_projectName" + ", ");
    buffer.write("clientName=" + "$_clientName" + ", ");
    buffer.write("totalAmount=" + (_totalAmount != null ? _totalAmount!.toString() : "null") + ", ");
    buffer.write("pendingAmount=" + (_pendingAmount != null ? _pendingAmount!.toString() : "null") + ", ");
    buffer.write("receivedAmount=" + (_receivedAmount != null ? _receivedAmount!.toString() : "null") + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PaymentDetails copyWith({String? projectName, String? clientName, double? totalAmount, double? pendingAmount, double? receivedAmount, amplify_core.TemporalDateTime? date}) {
    return PaymentDetails._internal(
      id: id,
      projectName: projectName ?? this.projectName,
      clientName: clientName ?? this.clientName,
      totalAmount: totalAmount ?? this.totalAmount,
      pendingAmount: pendingAmount ?? this.pendingAmount,
      receivedAmount: receivedAmount ?? this.receivedAmount,
      date: date ?? this.date);
  }
  
  PaymentDetails copyWithModelFieldValues({
    ModelFieldValue<String>? projectName,
    ModelFieldValue<String>? clientName,
    ModelFieldValue<double>? totalAmount,
    ModelFieldValue<double>? pendingAmount,
    ModelFieldValue<double>? receivedAmount,
    ModelFieldValue<amplify_core.TemporalDateTime>? date
  }) {
    return PaymentDetails._internal(
      id: id,
      projectName: projectName == null ? this.projectName : projectName.value,
      clientName: clientName == null ? this.clientName : clientName.value,
      totalAmount: totalAmount == null ? this.totalAmount : totalAmount.value,
      pendingAmount: pendingAmount == null ? this.pendingAmount : pendingAmount.value,
      receivedAmount: receivedAmount == null ? this.receivedAmount : receivedAmount.value,
      date: date == null ? this.date : date.value
    );
  }
  
  PaymentDetails.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _projectName = json['projectName'],
      _clientName = json['clientName'],
      _totalAmount = (json['totalAmount'] as num?)?.toDouble(),
      _pendingAmount = (json['pendingAmount'] as num?)?.toDouble(),
      _receivedAmount = (json['receivedAmount'] as num?)?.toDouble(),
      _date = json['date'] != null ? amplify_core.TemporalDateTime.fromString(json['date']) : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'projectName': _projectName, 'clientName': _clientName, 'totalAmount': _totalAmount, 'pendingAmount': _pendingAmount, 'receivedAmount': _receivedAmount, 'date': _date?.format(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'projectName': _projectName,
    'clientName': _clientName,
    'totalAmount': _totalAmount,
    'pendingAmount': _pendingAmount,
    'receivedAmount': _receivedAmount,
    'date': _date,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<PaymentDetailsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<PaymentDetailsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final PROJECTNAME = amplify_core.QueryField(fieldName: "projectName");
  static final CLIENTNAME = amplify_core.QueryField(fieldName: "clientName");
  static final TOTALAMOUNT = amplify_core.QueryField(fieldName: "totalAmount");
  static final PENDINGAMOUNT = amplify_core.QueryField(fieldName: "pendingAmount");
  static final RECEIVEDAMOUNT = amplify_core.QueryField(fieldName: "receivedAmount");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PaymentDetails";
    modelSchemaDefinition.pluralName = "PaymentDetails";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetails.PROJECTNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetails.CLIENTNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetails.TOTALAMOUNT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetails.PENDINGAMOUNT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetails.RECEIVEDAMOUNT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetails.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
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

class _PaymentDetailsModelType extends amplify_core.ModelType<PaymentDetails> {
  const _PaymentDetailsModelType();
  
  @override
  PaymentDetails fromJson(Map<String, dynamic> jsonData) {
    return PaymentDetails.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'PaymentDetails';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [PaymentDetails] in your schema.
 */
class PaymentDetailsModelIdentifier implements amplify_core.ModelIdentifier<PaymentDetails> {
  final String id;

  /** Create an instance of PaymentDetailsModelIdentifier using [id] the primary key. */
  const PaymentDetailsModelIdentifier({
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
  String toString() => 'PaymentDetailsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PaymentDetailsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}