import 'package:flutter/material.dart';
import './indicador_pag.dart';
import './textos.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm> {
  final PageController _stepFormController = PageController();
  int _pagina = 0;
  bool _mostrarBotaoLogin = false;
  final List _listadepag = [
    textos('assets/images/13.png', '', ''),
    textos('assets/images/15.png', '', ''),
    textos('assets/images/17.png', '', ''),
  ];

  @override
  void initState() {
    super.initState();
    _stepFormController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    setState(() {
      _pagina = _stepFormController.page?.round() ?? 0;
      _mostrarBotaoLogin = _pagina == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            // Deslizar para a direita (anterior)
            _pag(false);
          } else if (details.primaryVelocity! < 0) {
            // Deslizar para a esquerda (próximo)
            _pag(true);
          }
        },
        child: PageView.builder(
          controller: _stepFormController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _listadepag[index],
            );
          },
          itemCount: _listadepag.length,
        ),
      ),
      bottomNavigationBar: _mostrarBotaoLogin
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _pag(false),
                    child: Text("Anterior"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navegue para a página de login aqui
                      Navigator.of(context).pushReplacementNamed("/Home");
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _pag(false),
                    child: Text("Anterior"),
                  ),
                  indicadorpag(_pagina == 0),
                  indicadorpag(_pagina == 1),
                  indicadorpag(_pagina == 2),
                  TextButton(
                    onPressed: () => _pag(true),
                    child: Text("Próximo"),
                  ),
                ],
              ),
            ),
    );
  }

  void _pag(bool nextPage) {
    if (_pagina < 2 && nextPage) {
      _stepFormController.nextPage(
        duration: Duration(milliseconds: 280),
        curve: Curves.easeIn,
      );
    } else if (_pagina > 0 && !nextPage) {
      _stepFormController.previousPage(
        duration: Duration(milliseconds: 280),
        curve: Curves.easeIn,
      );
    }
  }
}
