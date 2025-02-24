import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:path/path.dart' as path;

class StorageService {
  Future<String> uploadFile(File file, String type) async {
    try {
      final extension = path.extension(file.path);
      final key = '$type/${DateTime.now().millisecondsSinceEpoch}$extension';

      await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromPath(path: file.path),
        key: key,
        options: const StorageUploadFileOptions(),
      ).result;
      
      return key;
    } catch (e) {
      print('Error uploading file: $e');
      throw Exception('Could not upload file: ${e.toString()}');
    }
  }

  Future<String> getDownloadUrl(String key) async {
    try {
      final result = await Amplify.Storage.getUrl(
        key: key,
        options: const StorageGetUrlOptions(
          expires: Duration(minutes: 60),
        ),
      ).result;
      return result.url.toString();
    } catch (e) {
      print('Error getting download URL: $e');
      throw Exception('Could not get download URL: ${e.toString()}');
    }
  }

  Future<void> deleteFile(String key) async {
    try {
      await Amplify.Storage.remove(
        key: key,
        options: const StorageRemoveOptions(),
      ).result;
    } catch (e) {
      print('Error deleting file: $e');
      throw Exception('Could not delete file: ${e.toString()}');
    }
  }
}