import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/widgets/card_swiper_widget.dart';
import 'package:peliculas_app/widgets/movie_slider_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Peliculas",
          style: TextStyle(
            color: Colors.indigo.shade100,
            fontFamily: 'Roboto',
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        //lista de elementos que se ponen a la derecha en el appbar
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [CardSwiperWidget(movies: moviesProvider.OnDisplayMovies,), MovieSliderWidget()]),
      ),
    );
  }
}
