import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EUPHO',
          style: TextStyle(color: Colors.blue[900]), // Cor do texto do título
        ),
        backgroundColor: Colors.black, // Define a cor de fundo do AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField('Email', emailController, TextInputType.emailAddress),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: buildTextField('Nome', firstNameController, TextInputType.name),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: buildTextField('Sobrenome', lastNameController, TextInputType.name),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              buildTextField('Data de Nascimento', dobController, TextInputType.datetime),
              SizedBox(height: 16.0),
              buildTermsCheckbox(),
              SizedBox(height: 16.0),
              buildRegisterButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, TextInputType keyboardType) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white), // Cor do texto da label
      ),
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.white), // Cor do texto do input
    );
  }

  Widget buildTermsCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: agreedToTerms,
          onChanged: (value) {
            setState(() {
              agreedToTerms = value!;
            });
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
            
            });
          },
          child: Text(
            'Li e concordo com os termos de uso',
            style: TextStyle(color: Colors.white), // Cor do texto do termo
          ),
        ),
      ],
    );
  }

  Widget buildRegisterButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      child: Text(
        'Registrar',
        style: TextStyle(color: Colors.white), // Cor do texto do botão
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.black, // Cor de fundo do botão
      ),
    );
  }
}
