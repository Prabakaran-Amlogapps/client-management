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

/** This is an auto generated class representing the Project type in your schema. */
class Project extends amplify_core.Model {
  static const classType = const _ProjectModelType();
  final String id;
  final String? _projectName;
  final String? _clientName;
  final amplify_core.TemporalDateTime? _projectDate;
  final String? _location;
  final String? _contactPerson;
  final String? _contactNumber;
  final double? _totalCost;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  ProjectModelIdentifier get modelIdentifier {
    return ProjectModelIdentifier(id: id);
  }

  String get projectName {
    try {
      return _projectName!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get clientName {
    try {
      return _clientName!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  amplify_core.TemporalDateTime get projectDate {
    try {
      return _projectDate!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get location {
    try {
      return _location!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get contactPerson {
    try {
      return _contactPerson!;
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

  double get totalCost {
    try {
      return _totalCost!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  amplify_core.TemporalDateTime get createdAt {
    try {
      return _createdAt!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  amplify_core.TemporalDateTime get updatedAt {
    try {
      return _updatedAt!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  const Project._internal(
      {required this.id,
      required projectName,
      required clientName,
      required projectDate,
      required location,
      required contactPerson,
      required contactNumber,
      required totalCost,
      required createdAt,
      required updatedAt})
      : _projectName = projectName,
        _clientName = clientName,
        _projectDate = projectDate,
        _location = location,
        _contactPerson = contactPerson,
        _contactNumber = contactNumber,
        _totalCost = totalCost,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Project(
      {String? id,
      required String projectName,
      required String clientName,
      required amplify_core.TemporalDateTime projectDate,
      required String location,
      required String contactPerson,
      required String contactNumber,
      required double totalCost,
      required amplify_core.TemporalDateTime createdAt,
      required amplify_core.TemporalDateTime updatedAt,
      required double receivedAmount,
      required double pendingAmount}) {
    return Project._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        projectName: projectName,
        clientName: clientName,
        projectDate: projectDate,
        location: location,
        contactPerson: contactPerson,
        contactNumber: contactNumber,
        totalCost: totalCost,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Project &&
        id == other.id &&
        _projectName == other._projectName &&
        _clientName == other._clientName &&
        _projectDate == other._projectDate &&
        _location == other._location &&
        _contactPerson == other._contactPerson &&
        _contactNumber == other._contactNumber &&
        _totalCost == other._totalCost &&
        _createdAt == other._createdAt &&
        _updatedAt == other._updatedAt;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Project {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("projectName=" + "$_projectName" + ", ");
    buffer.write("clientName=" + "$_clientName" + ", ");
    buffer.write("projectDate=" +
        (_projectDate != null ? _projectDate!.format() : "null") +
        ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("contactPerson=" + "$_contactPerson" + ", ");
    buffer.write("contactNumber=" + "$_contactNumber" + ", ");
    buffer.write("totalCost=" +
        (_totalCost != null ? _totalCost!.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Project copyWith(
      {String? projectName,
      String? clientName,
      amplify_core.TemporalDateTime? projectDate,
      String? location,
      String? contactPerson,
      String? contactNumber,
      double? totalCost,
      amplify_core.TemporalDateTime? createdAt,
      amplify_core.TemporalDateTime? updatedAt}) {
    return Project._internal(
        id: id,
        projectName: projectName ?? this.projectName,
        clientName: clientName ?? this.clientName,
        projectDate: projectDate ?? this.projectDate,
        location: location ?? this.location,
        contactPerson: contactPerson ?? this.contactPerson,
        contactNumber: contactNumber ?? this.contactNumber,
        totalCost: totalCost ?? this.totalCost,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  Project copyWithModelFieldValues(
      {ModelFieldValue<String>? projectName,
      ModelFieldValue<String>? clientName,
      ModelFieldValue<amplify_core.TemporalDateTime>? projectDate,
      ModelFieldValue<String>? location,
      ModelFieldValue<String>? contactPerson,
      ModelFieldValue<String>? contactNumber,
      ModelFieldValue<double>? totalCost,
      ModelFieldValue<amplify_core.TemporalDateTime>? createdAt,
      ModelFieldValue<amplify_core.TemporalDateTime>? updatedAt}) {
    return Project._internal(
        id: id,
        projectName: projectName == null ? this.projectName : projectName.value,
        clientName: clientName == null ? this.clientName : clientName.value,
        projectDate: projectDate == null ? this.projectDate : projectDate.value,
        location: location == null ? this.location : location.value,
        contactPerson:
            contactPerson == null ? this.contactPerson : contactPerson.value,
        contactNumber:
            contactNumber == null ? this.contactNumber : contactNumber.value,
        totalCost: totalCost == null ? this.totalCost : totalCost.value,
        createdAt: createdAt == null ? this.createdAt : createdAt.value,
        updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value);
  }

  Project.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _projectName = json['projectName'],
        _clientName = json['clientName'],
        _projectDate = json['projectDate'] != null
            ? amplify_core.TemporalDateTime.fromString(json['projectDate'])
            : null,
        _location = json['location'],
        _contactPerson = json['contactPerson'],
        _contactNumber = json['contactNumber'],
        _totalCost = (json['totalCost'] as num?)?.toDouble(),
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'projectName': _projectName,
        'clientName': _clientName,
        'projectDate': _projectDate?.format(),
        'location': _location,
        'contactPerson': _contactPerson,
        'contactNumber': _contactNumber,
        'totalCost': _totalCost,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'projectName': _projectName,
        'clientName': _clientName,
        'projectDate': _projectDate,
        'location': _location,
        'contactPerson': _contactPerson,
        'contactNumber': _contactNumber,
        'totalCost': _totalCost,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<ProjectModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<ProjectModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final PROJECTNAME = amplify_core.QueryField(fieldName: "projectName");
  static final CLIENTNAME = amplify_core.QueryField(fieldName: "clientName");
  static final PROJECTDATE = amplify_core.QueryField(fieldName: "projectDate");
  static final LOCATION = amplify_core.QueryField(fieldName: "location");
  static final CONTACTPERSON =
      amplify_core.QueryField(fieldName: "contactPerson");
  static final CONTACTNUMBER =
      amplify_core.QueryField(fieldName: "contactNumber");
  static final TOTALCOST = amplify_core.QueryField(fieldName: "totalCost");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Project";
    modelSchemaDefinition.pluralName = "Projects";

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
        key: Project.PROJECTNAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Project.CLIENTNAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Project.PROJECTDATE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Project.LOCATION,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Project.CONTACTPERSON,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Project.CONTACTNUMBER,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Project.TOTALCOST,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Project.CREATEDAT,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Project.UPDATEDAT,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));
  });

  get receivedAmount => null;

  get pendingAmount => null;
}

class _ProjectModelType extends amplify_core.ModelType<Project> {
  const _ProjectModelType();

  @override
  Project fromJson(Map<String, dynamic> jsonData) {
    return Project.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Project';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Project] in your schema.
 */
class ProjectModelIdentifier implements amplify_core.ModelIdentifier<Project> {
  final String id;

  /** Create an instance of ProjectModelIdentifier using [id] the primary key. */
  const ProjectModelIdentifier({required this.id});

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
  String toString() => 'ProjectModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ProjectModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
