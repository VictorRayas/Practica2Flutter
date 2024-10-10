import 'package:flutter/material.dart';

class Sendemail extends StatefulWidget {
  const Sendemail({super.key});

  @override
  State<Sendemail> createState() => _SendemailState();
}

class _SendemailState extends State<Sendemail> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>(); 
  final TextEditingController _emailController = TextEditingController();

String? validateEmail(String? value) {
  // Expresión regular para validar un correo electrónico
  final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese su correo electrónico';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Por favor, ingrese un correo electrónico válido';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/logo.png',width: 200,height: 200,),
            Form(
              key :_keyForm,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: validateEmail,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: "ejemplo@gmail.com",
                        label: Text('Correo Electronico')
                      ),
                      
                    ),
                  ),
                  const SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => {
                          if(_keyForm.currentState!.validate()){
                            Navigator.pushReplacementNamed(context, "/reviewCode")
                          }
                        }, 
                        child: 
                        const Text('Enviar código'),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.orange[800],
                          foregroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                          )
                        ),
                        ),
                                        ),
                    )
                ],
              )
              )
          ],
        ),
      ),
    );
  }
}