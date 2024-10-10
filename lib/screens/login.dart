import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
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
                padding: const EdgeInsets.all(16.0),
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
                        return 'Por favor, ingresa el correo electronico';
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
              const SizedBox(height: 8,),
              SizedBox(
                height: 48,
                width: double.infinity,
                
                child: ElevatedButton(
                  onPressed: () {  
                    if(_keyForm.currentState!.validate()){
                      print("Datos -> ${_emailController} ${_passwordController}");

                    }
                  }, 
                  child: 
                  const Text('Inciar Sesión'),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.amber[400],
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  
                  ),
                
              ),
              const SizedBox(height: 12,),
               InkWell(
                onTap:  ()=>{
                  Navigator.pushReplacementNamed(context, "/sendEmail")
                },
                child: const Text('Recuperar Constraseña',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),),
              )
            ],
          ),
        ),
      )
    );
  }
}