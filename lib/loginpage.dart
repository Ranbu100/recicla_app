import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'cadastro_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _body() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 35,
          right: 35,
          top: 8,
          bottom: 8,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(right: 200),
            child: Text("Login",
                style: TextStyle(
                  fontSize: 52, // Tamanho da fonte grande
                  color: Colors.blue[900],
                )),
          ),
          Container(
            height: 50,
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (text) {},
            decoration: InputDecoration(
              labelText: "CPF/CNPJ(Somente números)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person,
                  color: Colors.grey
                      .withOpacity(0.5), // Define a cor semi-transparente
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Senha",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.lock,
                  color: Colors.grey
                      .withOpacity(0.5), // Define a cor semi-transparente
                ),
              ),
            ),
          ),
          Container(
            height: 1,
          ),
          GestureDetector(
            onTap: () {
              // Adicione aqui a lógica para redirecionar para a página de cadastro
              Navigator.of(context).pushNamed("C");
            },
            child: Text(
              'Clique para se Cadastrar',
              style: TextStyle(
                color: Colors.blue, // Cor do texto quando não clicado
                decoration:
                    TextDecoration.underline, // Sublinhado quando não clicado
              ),
            ),
          ),
          Container(
            height: 30,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("Home");
                      },
                      style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Define um raio para tornar o botão circular
                    ), backgroundColor: Colors.yellow,
                  ),
                  
                      child: Container(
                          width: 100,
                          child: const Text(
                            'Entrar',
                            textAlign: TextAlign.center,
                          ))))),
        ]),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 0,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/images/8.png", fit: BoxFit.cover),
            ),
          ),
          _body(),
        ],
      ),
    );
  }
}
