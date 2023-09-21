import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Renan Gomes Mota"),
              accountEmail: Text("renan.mota2534@gmail.com"),
              
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Página Inicial'),
            // onTap: () {
            //   // Navegue para a página inicial aqui
            //   Navigator.pop(context); // Fecha o Drawer
            // },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            // onTap: () {
            //   // Navegue para a página de configurações aqui
            //   Navigator.pop(context); // Fecha o Drawer
            // },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre'),
            // onTap: () {
            //   // Navegue para a página "Sobre" aqui
            //   Navigator.pop(context); // Fecha o Drawer
            // },
          ),
            
          ],

        ),
      ),
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return InformationPage(
                  backgroundColor: index == 0
                      ? Colors.green
                      : (index == 1 ? Colors.green : Colors.green),
                  text: 'Página ${index + 1}',
                  imagePath: index == 0
                      ?'assets/images/pag2.png'
                      : (index == 1 ? 'assets/images/pag4.png' : 'assets/images/pag5.png'), // Substitua pelo caminho da sua imagem
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class InformationPage extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final String imagePath;

  InformationPage({
    required this.backgroundColor,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath), // Renderiza a imagem
          SizedBox(height: 20), // Espaço entre a imagem e o texto
          Text(
            text,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
