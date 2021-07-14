import 'package:flutter/material.dart';

import 'package:newsapp/screens/screens.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/theme/tema.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home' : ( _ ) => TabsScreen(),
        },
        
      ),
    );
  }
}