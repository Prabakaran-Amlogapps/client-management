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

/** This is an auto generated class representing the Client type in your schema. */
class Client extends amplify_core.Model {
  static const classType = const _ClientModelType();
  final String id;
  final String? _companyName;
  final String? _personName;
  final String? _position;
  final String? _contactNumber;
  final String? _email;
  final String? _address;
  final amplify_core.TemporalDateTime? _onboardDate;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  ClientModelIdentifier get modelIdentifier {
    return ClientModelIdentifier(id: id);
  }

  String get companyName {
    try {
      return _companyName!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get personName {
    try {
      return _personName!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get position {
    try {
      return _position!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get contactNumber {
    try {
      return _contactNumber!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get email {
    try {
      return _email!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get address {
    try {
      return _address!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  amplify_core.TemporalDateTime get onboardDate {
    try {
      return _onboardDate!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Client._internal(
      {required this.id,
      required companyName,
      required personName,
      required position,
      required contactNumber,
      required email,
      required address,
      required onboardDate,
      createdAt,
      updatedAt})
      : _companyName = companyName,
        _personName = personName,
        _position = position,
        _contactNumber = contactNumber,
        _email = email,
        _address = address,
        _onboardDate = onboardDate,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Client(
      {String? id,
      required String companyName,
      required String personName,
      required String position,
      required String contactNumber,
      required String email,
      required String address,
      required amplify_core.TemporalDateTime onboardDate}) {
    return Client._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        companyName: companyName,
        personName: personName,
        position: position,
        contactNumber: contactNumber,
        email: email,
        address: address,
        onboardDate: onboardDate);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Client &&
        id == other.id &&
        _companyName == other._companyName &&
        _personName == other._personName &&
        _position == other._position &&
        _contactNumber == other._contactNumber &&
        _email == other._email &&
        _address == other._address &&
        _onboardDate == other._onboardDate;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Client {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("companyName=" + "$_companyName" + ", ");
    buffer.write("personName=" + "$_personName" + ", ");
    buffer.write("position=" + "$_position" + ", ");
    buffer.write("contactNumber=" + "$_contactNumber" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("onboardDate=" +
        (_onboardDate != null ? _onboardDate!.format() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Client copyWith(
      {String? companyName,
      String? personName,
      String? position,
      String? contactNumber,
      String? email,
      String? address,
      amplify_core.TemporalDateTime? onboardDate}) {
    return Client._internal(
        id: id,
        companyName: companyName ?? this.companyName,
        personName: personName ?? this.personName,
        position: position ?? this.position,
        contactNumber: contactNumber ?? this.contactNumber,
        email: email ?? this.email,
        address: address ?? this.address,
        onboardDate: onboardDate ?? this.onboardDate);
  }

  Client copyWithModelFieldValues(
      {ModelFieldValue<String>? companyName,
      ModelFieldValue<String>? personName,
      ModelFieldValue<String>? position,
      ModelFieldValue<String>? contactNumber,
      ModelFieldValue<String>? email,
      ModelFieldValue<String>? address,
      ModelFieldValue<amplify_core.TemporalDateTime>? onboardDate}) {
    return Client._internal(
        id: id,
        companyName: companyName == null ? this.companyName : companyName.value,
        personName: personName == null ? this.personName : personName.value,
        position: position == null ? this.position : position.value,
        contactNumber:
            contactNumber == null ? this.contactNumber : contactNumber.value,
        email: email == null ? this.email : email.value,
        address: address == null ? this.address : address.value,
        onboardDate:
            onboardDate == null ? this.onboardDate : onboardDate.value);
  }

  Client.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _companyName = json['companyName'],
        _personName = json['personName'],
        _position = json['position'],
        _contactNumber = json['contactNumber'],
        _email = json['email'],
        _address = json['address'],
        _onboardDate = json['onboardDate'] != null
            ? amplify_core.TemporalDateTime.fromString(json['onboardDate'])
            : null,
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'companyName': _companyName,
        'personName': _personName,
        'position': _position,
        'contactNumber': _contactNumber,
        'email': _email,
        'address': _address,
        'onboardDate': _onboardDate?.format(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'companyName': _companyName,
        'personName': _personName,
        'position': _position,
        'contactNumber': _contactNumber,
        'email': _email,
        'address': _address,
        'onboardDate': _onboardDate,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<ClientModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<ClientModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final COMPANYNAME = amplify_core.QueryField(fieldName: "companyName");
  static final PERSONNAME = amplify_core.QueryField(fieldName: "personName");
  static final POSITION = amplify_core.QueryField(fieldName: "position");
  static final CONTACTNUMBER =
      amplify_core.QueryField(fieldName: "contactNumber");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final ONBOARDDATE = amplify_core.QueryField(fieldName: "onboardDate");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Client";
    modelSchemaDefinition.pluralName = "Clients";

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Client.COMPANYNAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Client.PERSONNAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Client.POSITION,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Client.CONTACTNUMBER,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Client.EMAIL,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Client.ADDRESS,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Client.ONBOARDDATE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'createdAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'updatedAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));
  });

  String? getFormattedOnboardDate() {}
}

class _ClientModelType extends amplify_core.ModelType<Client> {
  const _ClientModelType();

  @override
  Client fromJson(Map<String, dynamic> jsonData) {
    return Client.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Client';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Client] in your schema.
 */
class ClientModelIdentifier implements amplify_core.ModelIdentifier<Client> {
  final String id;

  /** Create an instance of ClientModelIdentifier using [id] the primary key. */
  const ClientModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'ClientModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ClientModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
