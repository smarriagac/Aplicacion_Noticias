import 'package:flutter/material.dart';

import 'package:newsapp/models/news_models.dart';

class NewService with ChangeNotifier {

  List<Article> headlines = [];

  NewService();

  getTopHeadLines(){

    print('Cargando headlines...');
  }

}