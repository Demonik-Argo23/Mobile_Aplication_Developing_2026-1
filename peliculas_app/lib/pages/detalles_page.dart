import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/casting_card_widget.dart';

class DetallesPage extends StatelessWidget {
  const DetallesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //scroll pero este cuenta con mas personalizacion
      body: CustomScrollView(
        //equivale a un children
        slivers: [
          //un app bar pero chetado
          SliverAppBar(
            expandedHeight: 400,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.all(0),
              title: Container(
                width: double.infinity,
                color: Colors.indigoAccent,
                child: Text(
                  "Detalles de la pelicula",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              background: FadeInImage(
                placeholder: AssetImage('NoImage.png'),
                image: NetworkImage(
                  'https://wallpapers.com/images/featured/dragon-ball-z-3izrb2kvqsbl3tun.jpg',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              PosterYTitulo(), 
              Sinopsis(),
              Sinopsis(),
              Sinopsis(),
              Sinopsis(),
              CastingCardWidget()
              ]),
          ),
        ],
      ),
    );
  }
}

class PosterYTitulo extends StatelessWidget {
  const PosterYTitulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('NoImage.png'),
              image: NetworkImage(
                'https://m.media-amazon.com/images/I/51jlGwFKXVL._AC_UF894,1000_QL80_.jpg',
              ),
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Column(
            children: [
              Text(
                "Nombre de la pelicula",
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Titulo original de la Pelicula",
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  SizedBox(width: 5),
                  Text("8.5", style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Sinopsis extends StatelessWidget {
  const Sinopsis({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        '''Enim commodo laborum ex cillum labore quis nostrud duis laborum est ex dolore. 
        Id adipisicing anim elit irure. Adipisicing ex id voluptate excepteur ex sint quis labore aute. Mollit 
        enim non sunt aute nostrud. Ad ex anim irure cupidatat Lorem. Sunt enim non consectetur ex minim amet 
        sit laborum. Sunt velit fugiat officia ea ullamco sit eu amet occaecat.''',
      textAlign: TextAlign.justify),
    );
  }
}
