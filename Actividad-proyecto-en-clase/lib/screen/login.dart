import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Color fondo = const Color(0xFFEDE7FF);
  final Color encabezado = const Color(0xFFAFDDFF);
  final Color campos = const Color(0xFFAFDDFF);
  final Color boton = const Color(0xFFAFDDFF);
  final Color texto = const Color(0xFFAFDDFF);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  // LOGIN con SharedPreferences
  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();

    String? savedEmail = prefs.getString('userEmail');
    String? savedPass = prefs.getString('userPassword');

    if (savedEmail == null || savedPass == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No hay usuarios registrados")),
      );
      return;
    }

    if (_emailController.text.trim() == savedEmail &&
        _contrasenaController.text.trim() == savedPass) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Inicio de sesión exitoso")),
      );

      // Aquí podrías navegar a tu HomePage futuramente
      // Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Credenciales incorrectas")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text('Login de usuario'),
        backgroundColor: encabezado,
        foregroundColor: Colors.white,
      ),

      // ---------- BODY MEJORADO ----------
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // Ícono
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Icon(
                    Icons.car_rental,
                    size: 110,
                    color: encabezado,
                  ),
                ),

                const SizedBox(height: 10),

                // Título
                Text(
                  "Bienvenido",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade700,
                  ),
                ),

                const SizedBox(height: 30),

                // Campo EMAIL
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      prefixIcon: Icon(Icons.email, color: encabezado),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Digite su email' : null,
                  ),
                ),

                const SizedBox(height: 25),

                // Campo CONTRASEÑA
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _contrasenaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      prefixIcon: Icon(Icons.lock, color: encabezado),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Digite su contraseña' : null,
                  ),
                ),

                const SizedBox(height: 35),

                // Botón
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: encabezado,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 40),

                // Enlace a Registro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿No tienes una cuenta?',
                      style: TextStyle(color: Colors.blueGrey.shade700),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Register(),
                          ),
                        );
                      },
                      child: Text(
                        "Regístrate",
                        style: TextStyle(
                          color: encabezado,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}