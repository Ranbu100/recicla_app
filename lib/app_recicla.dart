import 'package:flutter/material.dart';
import 'package:recicla_app/step_form.dart';
import 'app_controller.dart';
import 'cadastro_page.dart';
import 'home_page.dart';
import 'loginpage.dart';

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) => MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.yellow,
                brightness: AppController.instance.darkTheme
                    ? Brightness.dark
                    : Brightness.light,
              ),
              routes: {
                "/":(context) => StepForm(),
                "/Home":(context) => LoginPage(),
                "C":(context) => const RegistrationPage(),
                "Home":(context) => HomePage()
              }
            ));

    ;
    
  }
}
