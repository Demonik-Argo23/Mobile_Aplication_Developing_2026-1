import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';

class CardSwiperWidget extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiperWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.indigo.shade100,
      child: Swiper(
        layout: SwiperLayout.TINDER,
        itemCount: 3,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,

        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          //Convierte a su chavo (child) en un clickeable
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detalles_page'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FadeInImage(
                placeholder: AssetImage('goku_chad.png'),
                image: NetworkImage(
                  movie.fullPosterImg,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// 179d3b3918b06d4edd861bdead1a330f