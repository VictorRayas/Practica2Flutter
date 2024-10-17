import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _passwordRepeatController = TextEditingController();

bool _textPassword = true;
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
     
      body : Center(
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              Image.asset('assets/logo.png',width: 250,height: 250,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: validateEmail,
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "ejemplo@gmail.com",
                    label: Text("Correo Electronico"),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value){
                      if(value==null || value.isEmpty){
                        return 'Por favor, ingresa la contraseña';
                      }else{
                        return null;
                      }
                    },
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    label: Text("Contraseña"),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _textPassword = !_textPassword;
                        });
                      }, 
                      icon: Icon(_textPassword ? Icons.visibility_off : Icons.visibility))
                  ),
                  obscureText: _textPassword,
                  
                ),
                
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _passwordRepeatController,
                  validator: (value) {
                          if (value != _passwordController.text ) {
                            return 'Las contraseñas deben ser iguales, revisa de nuevo';
                          } else {
                            return null;
                          }
                        },
                  decoration: InputDecoration(
                    hintText: "Repetir contraseña",
                    label: Text("Repetir contraseña"),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _textPassword = !_textPassword;
                        });
                      }, 
                      icon: Icon(_textPassword ? Icons.visibility_off : Icons.visibility))
                  ),
                  obscureText: _textPassword,
                  
                ),
                
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 16,
                width: double.infinity,
                
                child: ElevatedButton(
                  onPressed: () async {  
                    if(_keyForm.currentState!.validate()){

                       try {
                            final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text
                            );
                            print(credential);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                      print("Datos -> ${_emailController} ${_passwordController}");

                    }
                  }, 
                  child: 
                  const Text('Registrar'),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.amber[400],
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  
                  ),
                
              ),
              
            ],
          ),
        ),
      )
    );
  }
}