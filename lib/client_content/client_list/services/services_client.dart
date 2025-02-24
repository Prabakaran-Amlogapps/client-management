// lib/services/client_service.dart
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:employee_client_management/models/Client.dart';

class ClientService {
  // Create a new client
  Future<void> createClient(Client client) async {
    try {
      await Amplify.DataStore.save(client);
    } catch (e) {
      print('Error creating client: $e');
      rethrow;
    }
  }

  // Read all clients
  Future<List<Client>> getAllClients() async {
    try {
      final clients = await Amplify.DataStore.query(Client.classType);
      return clients;
    } catch (e) {
      print('Error getting clients: $e');
      rethrow;
    }
  }

  // Read a single client
  Future<Client?> getClient(String id) async {
    try {
      final clients = await Amplify.DataStore.query(
        Client.classType,
        where: Client.ID.eq(id),
      );
      return clients.isNotEmpty ? clients.first : null;
    } catch (e) {
      print('Error getting client: $e');
      rethrow;
    }
  }

  // Update client
  Future<void> updateClient(Client updatedClient) async {
    try {
      final existingClients = await Amplify.DataStore.query(
        Client.classType,
        where: Client.ID.eq(updatedClient.id),
      );

      if (existingClients.isNotEmpty) {
        await Amplify.DataStore.save(updatedClient);
      }
    } catch (e) {
      print('Error updating client: $e');
      rethrow;
    }
  }

  // Delete client
  Future<void> deleteClient(String id) async {
    try {
      final clientToDelete = await getClient(id);
      if (clientToDelete != null) {
        await Amplify.DataStore.delete(clientToDelete);
      }
    } catch (e) {
      print('Error deleting client: $e');
      rethrow;
    }
  }
}
