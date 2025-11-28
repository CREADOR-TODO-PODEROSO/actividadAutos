import 'package:flutter/material.dart';
import 'edit_field_page.dart';
import 'change_password_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Datos de ejemplo (puedes cargarlos desde SharedPreferences o tu backend)
  String name = 'Maximus Gold';
  String username = '@derlaxy';
  String gender = 'Male';
  String birthday = '12-12-2000';
  String email = 'Derlaxy@yahoo.com';
  String phone = '(307) 555-0132';

  void _navigateAndEdit(String title, String currentValue, Function(String) onSave) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditFieldPage(title: title, initialValue: currentValue),
      ),
    );
    if (result != null && result is String) {
      onSave(result);
    }
  }

  Widget _buildTile(String label, String value, VoidCallback onTap, {IconData? icon}) {
    return ListTile(
      leading: icon != null
          ? Icon(icon, color: Colors.teal)
          : null,
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(value),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            // Card superior con foto y nombre
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(username, style: TextStyle(color: Colors.grey[600])),
                    ],
                  )
                ],
              ),
            ),

            const Divider(),

            // Lista de items
            Expanded(
              child: ListView(
                children: [
                  _buildTile('Gender', gender, () {
                    _navigateAndEdit('Gender', gender, (val) {
                      setState(() => gender = val);
                    });
                  }, icon: Icons.wc),
                  const Divider(),
                  _buildTile('Birthday', birthday, () {
                    _navigateAndEdit('Birthday', birthday, (val) {
                      setState(() => birthday = val);
                    });
                  }, icon: Icons.cake),
                  const Divider(),
                  _buildTile('Email', email, () {
                    _navigateAndEdit('Email', email, (val) {
                      setState(() => email = val);
                    });
                  }, icon: Icons.email),
                  const Divider(),
                  _buildTile('Phone Number', phone, () {
                    _navigateAndEdit('Phone Number', phone, (val) {
                      setState(() => phone = val);
                    });
                  }, icon: Icons.phone_android),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.teal),
                    title: const Text('Change Password', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: const Text('***************'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ChangePasswordPage()));
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
