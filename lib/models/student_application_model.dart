import 'package:cloud_firestore/cloud_firestore.dart';

class StudentApplication {
  final String? id;
  final String university;
  final String hostel;
  final String studentName;
  final String fatherName;
  final String className;
  final String caste;
  final DateTime dateOfBirth;
  final String bloodGroup;
  final String studentMobile;
  final String guardianMobile;
  final String permanentAddress;
  final String localGuardianName;
  final String localGuardianAddress;
  final String? admissionReceiptUrl;
  final String? aadhaarCardUrl;
  final String? photoUrl;
  final bool rulesConfirmed;
  final String status; // e.g., 'pending', 'approved', 'rejected'

  StudentApplication({
    this.id,
    required this.university,
    required this.hostel,
    required this.studentName,
    required this.fatherName,
    required this.className,
    required this.caste,
    required this.dateOfBirth,
    required this.bloodGroup,
    required this.studentMobile,
    required this.guardianMobile,
    required this.permanentAddress,
    required this.localGuardianName,
    required this.localGuardianAddress,
    this.admissionReceiptUrl,
    this.aadhaarCardUrl,
    this.photoUrl,
    required this.rulesConfirmed,
    this.status = 'pending',
  });

  Map<String, dynamic> toMap() {
    return {
      'university': university,
      'hostel': hostel,
      'studentName': studentName,
      'fatherName': fatherName,
      'className': className,
      'caste': caste,
      'dateOfBirth': Timestamp.fromDate(dateOfBirth),
      'bloodGroup': bloodGroup,
      'studentMobile': studentMobile,
      'guardianMobile': guardianMobile,
      'permanentAddress': permanentAddress,
      'localGuardianName': localGuardianName,
      'localGuardianAddress': localGuardianAddress,
      'admissionReceiptUrl': admissionReceiptUrl,
      'aadhaarCardUrl': aadhaarCardUrl,
      'photoUrl': photoUrl,
      'rulesConfirmed': rulesConfirmed,
      'status': status,
    };
  }

  factory StudentApplication.fromMap(Map<String, dynamic> map, String id) {
    return StudentApplication(
      id: id,
      university: map['university'] ?? '',
      hostel: map['hostel'] ?? '',
      studentName: map['studentName'] ?? '',
      fatherName: map['fatherName'] ?? '',
      className: map['className'] ?? '',
      caste: map['caste'] ?? '',
      dateOfBirth: (map['dateOfBirth'] as Timestamp).toDate(),
      bloodGroup: map['bloodGroup'] ?? '',
      studentMobile: map['studentMobile'] ?? '',
      guardianMobile: map['guardianMobile'] ?? '',
      permanentAddress: map['permanentAddress'] ?? '',
      localGuardianName: map['localGuardianName'] ?? '',
      localGuardianAddress: map['localGuardianAddress'] ?? '',
      admissionReceiptUrl: map['admissionReceiptUrl'],
      aadhaarCardUrl: map['aadhaarCardUrl'],
      photoUrl: map['photoUrl'],
      rulesConfirmed: map['rulesConfirmed'] ?? false,
      status: map['status'] ?? 'pending',
    );
  }

  factory StudentApplication.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return StudentApplication.fromMap(data, doc.id);
  }

  StudentApplication copyWith({
    String? id,
    String? university,
    String? hostel,
    String? studentName,
    String? fatherName,
    String? className,
    String? caste,
    DateTime? dateOfBirth,
    String? bloodGroup,
    String? studentMobile,
    String? guardianMobile,
    String? permanentAddress,
    String? localGuardianName,
    String? localGuardianAddress,
    String? admissionReceiptUrl,
    String? aadhaarCardUrl,
    String? photoUrl,
    bool? rulesConfirmed,
    String? status,
  }) {
    return StudentApplication(
      id: id ?? this.id,
      university: university ?? this.university,
      hostel: hostel ?? this.hostel,
      studentName: studentName ?? this.studentName,
      fatherName: fatherName ?? this.fatherName,
      className: className ?? this.className,
      caste: caste ?? this.caste,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      studentMobile: studentMobile ?? this.studentMobile,
      guardianMobile: guardianMobile ?? this.guardianMobile,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      localGuardianName: localGuardianName ?? this.localGuardianName,
      localGuardianAddress: localGuardianAddress ?? this.localGuardianAddress,
      admissionReceiptUrl: admissionReceiptUrl ?? this.admissionReceiptUrl,
      aadhaarCardUrl: aadhaarCardUrl ?? this.aadhaarCardUrl,
      photoUrl: photoUrl ?? this.photoUrl,
      rulesConfirmed: rulesConfirmed ?? this.rulesConfirmed,
      status: status ?? this.status,
    );
  }
}
