import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/models/category.dart';

import 'package:newsapp/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '813a97d3e0084a1985362e3521b52b8c';
class NewService with ChangeNotifier {

  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

        

  NewService(){
    this.getTopHeadLines();
  }

  getTopHeadLines() async {

    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co';

    final resp = await http.get(Uri.parse(url));

    final newsResponse = NewsRenponse.fromJson(resp.body); 

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  

}