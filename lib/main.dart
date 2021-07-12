import 'package:flutter/material.dart';

import 'package:newsapp/screens/screens.dart';
import 'package:newsapp/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: miTema,
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home' : ( _ ) => TabsScreen(),
      },
      
    );
  }
}