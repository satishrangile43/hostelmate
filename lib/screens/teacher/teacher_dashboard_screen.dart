
import 'package:flutter/material.dart';
import 'student_application_detail_screen.dart';
import 'all_students_screen.dart';
import 'room_management_screen.dart';
import 'messages_screen.dart';
import 'form_settings_screen.dart';

class TeacherDashboardScreen extends StatelessWidget {
  const TeacherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Teacher Dashboard'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pending Review'),
              Tab(text: 'Requires Refill'),
              Tab(text: 'Approved'),
            ],
          ),
        ),
        drawer: _buildDrawer(context),
        body: TabBarView(
          children: [
            _buildStudentList(context, 'Pending'),
            _buildStudentList(context, 'Refill'),
            _buildStudentList(context, 'Approved'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text(
              'Teacher Menu',
              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('All Students'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AllStudentsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.room_service),
            title: const Text('Room Management'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RoomManagementScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Send a Message'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MessagesScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Form Settings'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FormSettingsScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStudentList(BuildContext context, String status) {
    // Dummy data
    final students = [
      {'name': 'John Doe', 'status': 'Pending'},
      {'name': 'Jane Smith', 'status': 'Pending'},
      {'name': 'Peter Jones', 'status': 'Refill'},
      {'name': 'Mary Williams', 'status': 'Approved'},
    ];

    final filteredStudents = students.where((s) => s['status'] == status).toList();

    return ListView.builder(
      itemCount: filteredStudents.length,
      itemBuilder: (context, index) {
        final student = filteredStudents[index];
        return ListTile(
          title: Text(student['name']!),
          trailing: ElevatedButton(
            child: const Text('View'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentApplicationDetailScreen(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
