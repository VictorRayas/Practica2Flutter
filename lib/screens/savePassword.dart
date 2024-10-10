import 'package:flutter/material.dart';

class Savepassword extends StatefulWidget {
  const Savepassword({super.key});

  @override
  State<Savepassword> createState() => _SavepasswordState();
}

class _SavepasswordState extends State<Savepassword> {
  final GlobalKey<FormState> _keyform = GlobalKey();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passswordRepeat = TextEditingController();
  bool _textPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 250,
              height: 250,
            ),
            Form(
                key: _keyform,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                            hintText: 'Ej. rr43X_cir2',
                            label: Text('Coloca tu nueva contraseña'),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _textPassword = !_textPassword;
                                  });
                                },
                                icon: Icon(_textPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                        obscureText: _textPassword,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value != _password.text ) {
                            return 'Las contraseñas deben ser iguales, revisa de nuevo';
                          } else {
                            return null;
                          }
                        },
                        controller: _passswordRepeat,
                        decoration: InputDecoration(
                          hintText: 'Ej. rr43X_cir2',
                          label: Text('Repite tu  nueva contraseña'),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _textPassword = !_textPassword;
                                });
                              },
                              icon: Icon(_textPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),
                        obscureText: _textPassword,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_keyform.currentState!.validate()) {
                          
                            Navigator.pushReplacementNamed(context, "/");
                          }
                        },
                        child: const Text('Inciar Sesión'),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.amber[400],
                            foregroundColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
