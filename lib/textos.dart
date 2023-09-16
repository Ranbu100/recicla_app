import 'package:flutter/material.dart';

Widget textos(String imgUrl, String title, String descricao) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(imgUrl),
      Text(title,
      style: TextStyle(fontSize: 40, 
      color: Colors.black,
      fontWeight: FontWeight.bold
      ),
      ),
      Text(
        descricao,
        style: TextStyle(
          fontSize: 15,
          color:Colors.black54,
        ),
        textAlign: TextAlign.justify,
      )
    ],
    ),
  );
}