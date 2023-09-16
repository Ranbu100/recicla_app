import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_recicla.dart';

main(){
   // Inicialize o Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Impedir a rotação para o modo horizontal
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(AppWidget(title:"Recicla"));
}




