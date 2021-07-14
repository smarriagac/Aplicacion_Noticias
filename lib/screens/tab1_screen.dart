import 'package:flutter/material.dart';

import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final newService = Provider.of<NewService>(context);

    return Scaffold(
      body: ListaNoticias(newService.headlines),
  );
  }
}