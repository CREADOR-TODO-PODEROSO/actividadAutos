import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _current = TextEditingController();
  final _new = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _current.dispose();
    _new.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _doChange() {
    if (_formKey.currentState!.validate()) {
      // Aquí llamarías a tu backend o guardas localmente
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password changed (demo)')));
      Navigator.pop(context);
    }
  }

  String? _validateNotEmpty(String? v) => (v == null || v.isEmpty) ? 'Required' : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _current,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Current password', border: OutlineInputBorder()),
                validator: _validateNotEmpty,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _new,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'New password', border: OutlineInputBorder()),
                validator: _validateNotEmpty,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _confirm,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Confirm new password', border: OutlineInputBorder()),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Required';
                  if (v != _new.text) return 'Passwords do not match';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _doChange, child: const Text('Change password'))
            ],
          ),
        ),
      ),
    );
  }
}
