import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/models/cast.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/widgets/casting_card_widget.dart';
import 'package:provider/provider.dart';

class DetallesPage extends StatelessWidget {
  const DetallesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

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
                  movie.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              background: FadeInImage(
                placeholder: AssetImage('assets/NoImage.png'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.contain,
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              PosterYTitulo(movie: movie),
              Sinopsis(movie: movie),
              FutureBuilder<List<Cast>>(
                future: moviesProvider.getMovieCast(movie.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: 160,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Container(
                      height: 160,
                      child: Center(child: Text('No hay información del cast')),
                    );
                  }

                  return CastingCardWidget(casts: snapshot.data!);
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class PosterYTitulo extends StatelessWidget {
  final Movie movie;
  const PosterYTitulo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/NoImage.png'),
              image: NetworkImage(movie.fullPosterImg),
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Column(
            children: [
              Text(movie.title, overflow: TextOverflow.fade),
              Text(
                movie.originalTitle,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.fade,
              ),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    movie.voteAverage.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
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
  final Movie movie;
  const Sinopsis({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
