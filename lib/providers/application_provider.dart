import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import '../models/student_application_model.dart';
import '../services/storage_service.dart';

class ApplicationProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StorageService _storageService = StorageService();

  StudentApplication? _application;
  bool _isLoading = false;
  String? _error;

  StudentApplication? get application => _application;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> submitApplication(
      StudentApplication application,
      File? admissionReceipt,
      File? aadhaarCard,
      File? photo) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }

      final admissionReceiptUrl = await _uploadFile(
          user.uid, 'admission_receipt.jpg', admissionReceipt);
      final aadhaarCardUrl = await _uploadFile(
          user.uid, 'aadhaar_card.jpg', aadhaarCard);
      final photoUrl = await _uploadFile(user.uid, 'photo.jpg', photo);

      final newApplication = application.copyWith(
        admissionReceiptUrl: admissionReceiptUrl,
        aadhaarCardUrl: aadhaarCardUrl,
        photoUrl: photoUrl,
      );

      await _saveApplication(user.uid, newApplication);

      _application = newApplication;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> _uploadFile(
      String userId, String fileName, File? file) async {
    if (file == null) return null;
    try {
      return await _storageService.uploadFile(
          'applications/$userId/$fileName', file);
    } catch (e) {
      throw Exception('Failed to upload $fileName: $e');
    }
  }

  Future<void> _saveApplication(
      String userId, StudentApplication application) async {
    try {
      await _firestore
          .collection('students')
          .doc(userId)
          .set(application.toMap());
    } catch (e) {
      throw Exception('Failed to save application: $e');
    }
  }
}
