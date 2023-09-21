import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  String mensagemErro = '';

  void _verificarCampos() {
    if (emailController.text.isEmpty ||
        nomeController.text.isEmpty ||
        cpfController.text.isEmpty ||
        senhaController.text.isEmpty ||
        confirmarSenhaController.text.isEmpty) {
      setState(() {
        mensagemErro = 'Todos os campos são obrigatórios.';
      });
      return;
    }

    if (senhaController.text != confirmarSenhaController.text) {
      setState(() {
        mensagemErro = 'As senhas não coincidem.';
      });
    } else {
      setState(() {
        mensagemErro = '';
      });
      Navigator.of(context).pushNamed("/Home");// Faça o que for necessário para concluir o cadastro
    }
    
  }

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cadastro",
                style: TextStyle(
                  fontSize: 52,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: "Nome Completo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: Icon(
                    Icons.account_box,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: cpfController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "CPF/CNPJ (Somente números)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: Icon(
                    Icons.person,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: Icon(
                    Icons.lock_rounded,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: confirmarSenhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirmar Senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: Icon(
                    Icons.lock_rounded,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _verificarCampos();
                  
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  backgroundColor: Colors.yellow,
                ),
                child: Container(
                  width: 100,
                  child: const Text(
                    'Cadastrar',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text(
                mensagemErro,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/images/8.png", fit: BoxFit.cover),
          ),
          _body(),
        ],
      ),
    );
  }
}
