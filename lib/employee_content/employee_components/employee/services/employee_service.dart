import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../model/models.dart';

class EmployeeService {
  Future<List<Employee>> listEmployees() async {
    try {
      final request = ModelQueries.list(Employee.classType);
      final response = await Amplify.API.query(request: request).response;
      return response.data?.items.whereType<Employee>().toList() ?? [];
    } catch (e) {
      print('Error fetching employees: $e');
      throw Exception('Could not fetch employees: ${e.toString()}');
    }
  }

  Future<Employee> createEmployee(Employee employee) async {
    try {
      final request = ModelMutations.create(employee);
      final response = await Amplify.API.mutate(request: request).response;
      if (response.data == null) {
        throw Exception('Failed to create employee');
      }
      return response.data!;
    } catch (e) {
      print('Error creating employee: $e');
      throw Exception('Could not create employee: ${e.toString()}');
    }
  }

  Future<Employee> updateEmployee(Employee employee) async {
    try {
      final request = ModelMutations.update(employee);
      final response = await Amplify.API.mutate(request: request).response;
      if (response.data == null) {
        throw Exception('Failed to update employee');
      }
      return response.data!;
    } catch (e) {
      print('Error updating employee: $e');
      throw Exception('Could not update employee: ${e.toString()}');
    }
  }

  Future<void> deleteEmployee(Employee employee) async {
    try {
      final request = ModelMutations.delete(employee);
      await Amplify.API.mutate(request: request).response;
    } catch (e) {
      print('Error deleting employee: $e');
      throw Exception('Could not delete employee: ${e.toString()}');
    }
  }

  Future<Employee?> getEmployee(String id) async {
    try {
      final response = await Amplify.API.query(
        request: ModelQueries.list(
          Employee.classType,
        //  where: QueryField.eq('id', id),
        ),
      ).response;
      
      final employees = response.data?.items.whereType<Employee>().toList() ?? [];
      return employees.isNotEmpty ? employees.first : null;
    } catch (e) {
      print('Error getting employee: $e');
      throw Exception('Could not get employee: ${e.toString()}');
    }
  }
}
