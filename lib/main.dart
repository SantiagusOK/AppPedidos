import 'package:ejemplos_2do_soft_9010/default_theme.dart';
import 'package:ejemplos_2do_soft_9010/routes.dart';
import 'package:flutter/material.dart';

//Cubits
void main() async {
  runApp(const Examples2ndApp());
}

class Examples2ndApp extends StatelessWidget {
  const Examples2ndApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Frutality().add(FEInitFrutalityEvent());

    return MaterialApp.router(
        title: 'Ejemplos 2do TSDdS IES 9-010',
        theme: defaultTheme(context),
        routerConfig: examples2ndRouter);
  }
}
