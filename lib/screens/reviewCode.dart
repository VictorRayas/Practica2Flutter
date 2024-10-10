import 'package:flutter/material.dart';

class ReviewCode extends StatefulWidget {
  const ReviewCode({super.key});

  @override
  State<ReviewCode> createState() => _ReviewCodeState();
}

class _ReviewCodeState extends State<ReviewCode> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Image.asset(
            'assets/logo.png',
            width: 200,
            height: 200,
          ),
          Form(
            key: _keyForm,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el código';
                  } else {
                    return null;
                  }
                },
                controller: _codeController,
                decoration: const InputDecoration(
                  hintText: 'ej: 39948204',
                  label: Text('Coloca el código de verificación'),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, "/savePassword");
                  }
                },
                child: const Text('Validar Código'),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.pink[800],
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
