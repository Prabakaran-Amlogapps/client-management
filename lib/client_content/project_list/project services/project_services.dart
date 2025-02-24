import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:employee_client_management/models/Project.dart';

class ProjectService {
  // Create a new project
  Future<void> createProject(Project project) async {
    try {
      final request = ModelMutations.create(project);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.errors.isNotEmpty) {
        throw Exception('Failed to create project: ${response.errors}');
      }
    } catch (e) {
      throw Exception('Error creating project: $e');
    }
  }

  // Read all projects
  Future<List<Project>> getAllProjects() async {
    try {
      final request = ModelQueries.list(Project.classType);
      final response = await Amplify.API.query(request: request).response;

      if (response.errors.isNotEmpty) {
        throw Exception('Failed to get projects: ${response.errors}');
      }

      return response.data?.items.map((item) => item as Project).toList() ?? [];
    } catch (e) {
      throw Exception('Error getting projects: $e');
    }
  }

  // Read a single project
  Future<Project?> getProject(String id) async {
    try {
      final modelIdentifier = ProjectModelIdentifier(id: id);
      final request = ModelQueries.get(Project.classType, modelIdentifier);
      final response = await Amplify.API.query(request: request).response;

      if (response.errors.isNotEmpty) {
        throw Exception('Failed to get project: ${response.errors}');
      }

      return response.data;
    } catch (e) {
      throw Exception('Error getting project: $e');
    }
  }

  // Update a project
  Future<void> updateProject(Project project) async {
    try {
      final request = ModelMutations.update(project);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.errors.isNotEmpty) {
        throw Exception('Failed to update project: ${response.errors}');
      }
    } catch (e) {
      throw Exception('Error updating project: $e');
    }
  }

  // Delete a project
  Future<void> deleteProject(String id) async {
    try {
      final project = await getProject(id);
      if (project == null) {
        throw Exception('Project not found');
      }

      final request = ModelMutations.delete(project);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.errors.isNotEmpty) {
        throw Exception('Failed to delete project: ${response.errors}');
      }
    } catch (e) {
      throw Exception('Error deleting project: $e');
    }
  }
}
