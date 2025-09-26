import 'dart:io';
import 'package:flutter/material.dart';

import '../../models/student_application_model.dart';
import 'application_provider.dart';

class ApplicationFormProvider extends ChangeNotifier {
  final ApplicationProvider _applicationProvider;

  ApplicationFormProvider(this._applicationProvider);

  final _formKey = GlobalKey<FormState>();

  final _universityController = TextEditingController();
  final _hostelController = TextEditingController();
  final _studentNameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _classNameController = TextEditingController();
  final _casteController = TextEditingController();
  final _bloodGroupController = TextEditingController();
  final _studentMobileController = TextEditingController();
  final _guardianMobileController = TextEditingController();
  final _permanentAddressController = TextEditingController();
  final _localGuardianNameController = TextEditingController();
  final _localGuardianAddressController = TextEditingController();

  DateTime? _dateOfBirth;
  File? _admissionReceipt;
  File? _aadhaarCard;
  File? _photo;
  bool _rulesConfirmed = false;

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get universityController => _universityController;
  TextEditingController get hostelController => _hostelController;
  TextEditingController get studentNameController => _studentNameController;
  TextEditingController get fatherNameController => _fatherNameController;
  TextEditingController get classNameController => _classNameController;
  TextEditingController get casteController => _casteController;
  TextEditingController get bloodGroupController => _bloodGroupController;
  TextEditingController get studentMobileController => _studentMobileController;
  TextEditingController get guardianMobileController => _guardianMobileController;
  TextEditingController get permanentAddressController => _permanentAddressController;
  TextEditingController get localGuardianNameController => _localGuardianNameController;
  TextEditingController get localGuardianAddressController => _localGuardianAddressController;

  DateTime? get dateOfBirth => _dateOfBirth;
  File? get admissionReceipt => _admissionReceipt;
  File? get aadhaarCard => _aadhaarCard;
  File? get photo => _photo;
  bool get rulesConfirmed => _rulesConfirmed;

  bool get isLoading => _applicationProvider.isLoading;

  void setDateOfBirth(DateTime date) {
    _dateOfBirth = date;
    notifyListeners();
  }

  void setAdmissionReceipt(File file) {
    _admissionReceipt = file;
    notifyListeners();
  }

  void setAadhaarCard(File file) {
    _aadhaarCard = file;
    notifyListeners();
  }

  void setPhoto(File file) {
    _photo = file;
    notifyListeners();
  }

  void setRulesConfirmed(bool value) {
    _rulesConfirmed = value;
    notifyListeners();
  }

  void submitForm() {
    if (_formKey.currentState!.validate() && _rulesConfirmed) {
      final application = StudentApplication(
        university: _universityController.text,
        hostel: _hostelController.text,
        studentName: _studentNameController.text,
        fatherName: _fatherNameController.text,
        className: _classNameController.text,
        caste: _casteController.text,
        dateOfBirth: _dateOfBirth!,
        bloodGroup: _bloodGroupController.text,
        studentMobile: _studentMobileController.text,
        guardianMobile: _guardianMobileController.text,
        permanentAddress: _permanentAddressController.text,
        localGuardianName: _localGuardianNameController.text,
        localGuardianAddress: _localGuardianAddressController.text,
        admissionReceiptUrl: '',
        aadhaarCardUrl: '',
        photoUrl: '',
        rulesConfirmed: _rulesConfirmed,
      );

      _applicationProvider.submitApplication(
          application, _admissionReceipt, _aadhaarCard, _photo);
    }
  }

  @override
  void dispose() {
    _universityController.dispose();
    _hostelController.dispose();
    _studentNameController.dispose();
    _fatherNameController.dispose();
    _classNameController.dispose();
    _casteController.dispose();
    _bloodGroupController.dispose();
    _studentMobileController.dispose();
    _guardianMobileController.dispose();
    _permanentAddressController.dispose();
    _localGuardianNameController.dispose();
    _localGuardianAddressController.dispose();
    super.dispose();
  }
}
