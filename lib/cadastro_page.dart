import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResgistrationPage extends StatefulWidget {
  const ResgistrationPage({super.key});

  @override
  State<ResgistrationPage> createState() => _ResgistrationPageState();
}

class _ResgistrationPageState extends State<ResgistrationPage> {
  @override
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();
  String mensagemErro = '';

  void _verificarSenhas() {
    if (senhaController.text != confirmarSenhaController.text) {
      setState(() {
        mensagemErro = 'As senhas não coincidem.';
      });
    } else {
      setState(() {
        mensagemErro = '';
      });
      // Faça o que for necessário para concluir o cadastro
    }
  }

  List<String> senha = [];
  List<String> cpf = [];
  String csenha = '';
  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 100,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Nome Completo",
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                cpf.add(text);
              },
              decoration: InputDecoration(
                labelText: "CPF/CNPJ(Somente números)",
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              height: 10,
            ),
            
         
            
           
            TextField(
              onChanged: (text) {
                csenha = text;
              },
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              height: 10,
            ),
            TextField(
              onChanged: (text) {
                if (csenha == text) {
                  senha.add(text);
                } else {}
              },
              controller: confirmarSenhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirmar Senha",
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print("Cadastrado com Sucesso");
                  Navigator.of(context).pushReplacementNamed("/Home");
                },
                child: Container(
                    width: 100,
                    child: const Text(
                      'Cadastrar',
                      textAlign: TextAlign.center,
                    ))),
            Text(
              mensagemErro,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/images/10.png", fit: BoxFit.cover),
          ),
          _body(),
        ],
      ),
    );
  }
}

/*

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            TextField(
              controller: confirmarSenhaController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirmar Senha'),
            ),
            ElevatedButton(
              onPressed: _verificarSenhas,
              child: Text('Cadastrar'),
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
    );
  }
}

 */
