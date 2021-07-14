import 'package:flutter/material.dart';
import 'package:newsapp/models/models.dart';
import 'package:newsapp/services/news_service.dart';

import 'package:newsapp/theme/tema.dart';
import 'package:newsapp/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final newsServices = Provider.of<NewService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),
            Expanded(
              child: ListaNoticias(newsServices.getArticulosCategoriaSeleccionada!)
            )
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

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
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
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton( this.categoria);


  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
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
          color: (newsService.selectedCategory == this.categoria.name)
                ?  miTema.accentColor          
                : Colors.black54
        ),
      ),
    );
  }
}