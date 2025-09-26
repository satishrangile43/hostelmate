import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile(String path, File file) async {
    try {
      final ref = _storage.ref(path);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw Exception('File upload failed: ${e.code}');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteFile(String url) async {
    if (url.isEmpty) return;
    try {
      final ref = _storage.refFromURL(url);
      await ref.delete();
    } on FirebaseException catch (e) {
      if (e.code != 'object-not-found') {
        throw Exception('File deletion failed: ${e.code}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
