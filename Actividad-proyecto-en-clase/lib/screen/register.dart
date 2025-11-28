import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Color fondo = const Color(0xFFEDE7FF);
  final Color encabezado = const Color(0xFFAFDDFF);
  final Color campos = const Color(0xFFAFDDFF);
  final Color boton = const Color(0xFFAFDDFF);
  final Color texto = const Color(0xFFAFDDFF);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmarPassController = TextEditingController();

  // Guardar usuario en SharedPreferences
  Future<void> _registrar() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text.trim() !=
          _confirmarPassController.text.trim()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Las contraseñas no coinciden")),
        );
        return;
      }

      final SharedPreferences prefs =
          await SharedPreferences.getInstance();

      await prefs.setString('userEmail', _emailController.text.trim());
      await prefs.setString('userPassword', _passwordController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario registrado correctamente")),
      );

      Navigator.pop(context); // regresar al login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text('Registro de usuario'),
        backgroundColor: encabezado,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Icon(Icons.person_add_alt_1, size: 80, color: encabezado),
              const SizedBox(height: 20),

              // EMAIL
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: campos,
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Digite su email' : null,
              ),
              const SizedBox(height: 16),

              // CONTRASEÑA
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: campos,
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Digite una contraseña' : null,
              ),
              const SizedBox(height: 16),

              // CONFIRMAR CONTRASEÑA
              TextFormField(
                controller: _confirmarPassController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: campos,
                  labelText: 'Confirmar contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Confirme su contraseña' : null,
              ),
              const SizedBox(height: 20),

              // BOTÓN REGISTRAR
              ElevatedButton(
                onPressed: _registrar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: boton,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  'Registrar Usuario',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
