import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:provider/provider.dart';


class Tab2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: _ListaCategorias())
          ],
      ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewService>(context).categories;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext contex, int index){

        final cName =categories[index].name;

        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              _CategoryButton(categories[index]),
              SizedBox(height: 5,),
              Text('${cName[0].toUpperCase()}${cName.substring(1)}')
            ],
          ),
        );
      }
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton( this.categoria);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('${categoria.name}'),
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categoria.icon,
          color: Colors.black54,
        ),
      ),
    );
  }
}