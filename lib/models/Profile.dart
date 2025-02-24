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

/** This is an auto generated class representing the Profile type in your schema. */
class Profile extends amplify_core.Model {
  static const classType = const _ProfileModelType();
  final String id;
  final String? _name;
  final String? _companyName;
  final String? _industry;
  final int? _numberOfEmployees;
  final String? _address;
  final String? _contact;
  final String? _email;
  final amplify_core.TemporalDateTime? _updatedAt;
  final amplify_core.TemporalDateTime? _createdAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  ProfileModelIdentifier get modelIdentifier {
    return ProfileModelIdentifier(id: id);
  }

  String get name {
    try {
      return _name!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
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

  String get industry {
    try {
      return _industry!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  int get numberOfEmployees {
    try {
      return _numberOfEmployees!;
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

  String get contact {
    try {
      return _contact!;
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

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  const Profile._internal(
      {required this.id,
      required name,
      required companyName,
      required industry,
      required numberOfEmployees,
      required address,
      required contact,
      required email,
      updatedAt,
      createdAt})
      : _name = name,
        _companyName = companyName,
        _industry = industry,
        _numberOfEmployees = numberOfEmployees,
        _address = address,
        _contact = contact,
        _email = email,
        _updatedAt = updatedAt,
        _createdAt = createdAt;

  factory Profile(
      {String? id,
      required String name,
      required String companyName,
      required String industry,
      required int numberOfEmployees,
      required String address,
      required String contact,
      required String email,
      amplify_core.TemporalDateTime? updatedAt}) {
    return Profile._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        name: name,
        companyName: companyName,
        industry: industry,
        numberOfEmployees: numberOfEmployees,
        address: address,
        contact: contact,
        email: email,
        updatedAt: updatedAt);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
        id == other.id &&
        _name == other._name &&
        _companyName == other._companyName &&
        _industry == other._industry &&
        _numberOfEmployees == other._numberOfEmployees &&
        _address == other._address &&
        _contact == other._contact &&
        _email == other._email &&
        _updatedAt == other._updatedAt;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Profile {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("companyName=" + "$_companyName" + ", ");
    buffer.write("industry=" + "$_industry" + ", ");
    buffer.write("numberOfEmployees=" +
        (_numberOfEmployees != null ? _numberOfEmployees!.toString() : "null") +
        ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("contact=" + "$_contact" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("updatedAt=" +
        (_updatedAt != null ? _updatedAt!.format() : "null") +
        ", ");
    buffer.write(
        "createdAt=" + (_createdAt != null ? _createdAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Profile copyWith(
      {String? name,
      String? companyName,
      String? industry,
      int? numberOfEmployees,
      String? address,
      String? contact,
      String? email,
      amplify_core.TemporalDateTime? updatedAt}) {
    return Profile._internal(
        id: id,
        name: name ?? this.name,
        companyName: companyName ?? this.companyName,
        industry: industry ?? this.industry,
        numberOfEmployees: numberOfEmployees ?? this.numberOfEmployees,
        address: address ?? this.address,
        contact: contact ?? this.contact,
        email: email ?? this.email,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  Profile copyWithModelFieldValues(
      {ModelFieldValue<String>? name,
      ModelFieldValue<String>? companyName,
      ModelFieldValue<String>? industry,
      ModelFieldValue<int>? numberOfEmployees,
      ModelFieldValue<String>? address,
      ModelFieldValue<String>? contact,
      ModelFieldValue<String>? email,
      ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt}) {
    return Profile._internal(
        id: id,
        name: name == null ? this.name : name.value,
        companyName: companyName == null ? this.companyName : companyName.value,
        industry: industry == null ? this.industry : industry.value,
        numberOfEmployees: numberOfEmployees == null
            ? this.numberOfEmployees
            : numberOfEmployees.value,
        address: address == null ? this.address : address.value,
        contact: contact == null ? this.contact : contact.value,
        email: email == null ? this.email : email.value,
        updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value);
  }

  Profile.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _companyName = json['companyName'],
        _industry = json['industry'],
        _numberOfEmployees = (json['numberOfEmployees'] as num?)?.toInt(),
        _address = json['address'],
        _contact = json['contact'],
        _email = json['email'],
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null,
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': _name,
        'companyName': _companyName,
        'industry': _industry,
        'numberOfEmployees': _numberOfEmployees,
        'address': _address,
        'contact': _contact,
        'email': _email,
        'updatedAt': _updatedAt?.format(),
        'createdAt': _createdAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'name': _name,
        'companyName': _companyName,
        'industry': _industry,
        'numberOfEmployees': _numberOfEmployees,
        'address': _address,
        'contact': _contact,
        'email': _email,
        'updatedAt': _updatedAt,
        'createdAt': _createdAt
      };

  static final amplify_core.QueryModelIdentifier<ProfileModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<ProfileModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final COMPANYNAME = amplify_core.QueryField(fieldName: "companyName");
  static final INDUSTRY = amplify_core.QueryField(fieldName: "industry");
  static final NUMBEROFEMPLOYEES =
      amplify_core.QueryField(fieldName: "numberOfEmployees");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final CONTACT = amplify_core.QueryField(fieldName: "contact");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Profile";
    modelSchemaDefinition.pluralName = "Profiles";

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
        key: Profile.NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Profile.COMPANYNAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Profile.INDUSTRY,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Profile.NUMBEROFEMPLOYEES,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Profile.ADDRESS,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Profile.CONTACT,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Profile.EMAIL,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Profile.UPDATEDAT,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'createdAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));
  });

  static Future<Profile?> fromMap(Map<String, Object?> map) async {
    // Implement the logic to create a Profile instance from the map
    // For now, returning null to avoid compile error
    return null;
  }
}

class _ProfileModelType extends amplify_core.ModelType<Profile> {
  const _ProfileModelType();

  @override
  Profile fromJson(Map<String, dynamic> jsonData) {
    return Profile.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Profile';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Profile] in your schema.
 */
class ProfileModelIdentifier implements amplify_core.ModelIdentifier<Profile> {
  final String id;

  /** Create an instance of ProfileModelIdentifier using [id] the primary key. */
  const ProfileModelIdentifier({required this.id});

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
  String toString() => 'ProfileModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ProfileModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
