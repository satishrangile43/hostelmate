import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/application_form_provider.dart';
import '../../common/widgets/form_fields.dart';

class ApplicationFormScreen extends StatelessWidget {
  const ApplicationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ApplicationFormProvider(Provider.of(context, listen: false)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hostel Application Form'),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: Consumer<ApplicationFormProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSectionTitle('Hostel Selection'),
                    buildDropdown(
                        label: 'University',
                        items: ['University A', 'University B'],
                        controller: provider.universityController),
                    buildDropdown(
                        label: 'Hostel',
                        items: ['Hostel 1', 'Hostel 2'],
                        controller: provider.hostelController),
                    const SizedBox(height: 24),
                    buildSectionTitle('Student Information'),
                    buildTextField(
                        label: 'Student\'s Name',
                        controller: provider.studentNameController),
                    buildTextField(
                        label: 'Father\'s/Guardian\'s Name',
                        controller: provider.fatherNameController),
                    buildTextField(
                        label: 'Class / Semester',
                        controller: provider.classNameController),
                    buildTextField(
                        label: 'Caste / Category',
                        controller: provider.casteController),
                    buildDatePicker(
                      context: context,
                      label: 'Date of Birth',
                      selectedDate: provider.dateOfBirth,
                      onDateSelected: provider.setDateOfBirth,
                    ),
                    buildTextField(
                        label: 'Blood Group',
                        controller: provider.bloodGroupController),
                    buildTextField(
                        label: 'Mobile Number (Student)',
                        controller: provider.studentMobileController,
                        keyboardType: TextInputType.phone),
                    buildTextField(
                        label: 'Mobile Number (Guardian)',
                        controller: provider.guardianMobileController,
                        keyboardType: TextInputType.phone),
                    buildTextField(
                        label: 'Permanent Address',
                        controller: provider.permanentAddressController,
                        maxLines: 3),
                    const SizedBox(height: 24),
                    buildSectionTitle('Local Guardian'),
                    buildTextField(
                        label: 'Local Guardian\'s Name',
                        controller: provider.localGuardianNameController),
                    buildTextField(
                        label: 'Local Guardian\'s Address',
                        controller: provider.localGuardianAddressController,
                        maxLines: 3),
                    const SizedBox(height: 24),
                    buildSectionTitle('Document Checklist'),
                    buildFileUpload(
                      context: context,
                      label: 'College Admission Receipt',
                      file: provider.admissionReceipt,
                      onPicked: provider.setAdmissionReceipt,
                    ),
                    buildFileUpload(
                      context: context,
                      label: 'Aadhaar Card Copy',
                      file: provider.aadhaarCard,
                      onPicked: provider.setAadhaarCard,
                    ),
                    buildFileUpload(
                      context: context,
                      label: 'Passport Size Photo',
                      file: provider.photo,
                      onPicked: provider.setPhoto,
                    ),
                    const SizedBox(height: 24),
                    buildSectionTitle('Hostel Rules'),
                    Container(
                      height: 150,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const SingleChildScrollView(
                        child: Text(
                          '1. Rule one...\n2. Rule two...\n3. Rule three...\n(Full list of rules here)',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    CheckboxListTile(
                      title: const Text(
                          'I confirm that I have read and understood all the rules...'),
                      value: provider.rulesConfirmed,
                      onChanged: (bool? value) {
                        provider.setRulesConfirmed(value ?? false);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 48),
                        ),
                        onPressed: provider.isLoading ? null : provider.submitForm,
                        child: provider.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Submit Application',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
