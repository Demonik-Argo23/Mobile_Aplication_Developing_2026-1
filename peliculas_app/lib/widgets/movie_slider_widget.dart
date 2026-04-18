import 'package:flutter/material.dart';

class MovieSliderWidget extends StatelessWidget {
  const MovieSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 300,
      child: Column(
        children: [
          Text("populares"),
          SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index){
                return MoviePoster();
              }
              )
            )
        ],
      ),
    );
  }
}


class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 130,
      height: 190,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,
               'Detalles_page');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('descarga.png'), 
                image: NetworkImage('https://m.media-amazon.com/images/I/61A9H3IIQqL.jpg'),
                width: 130,
                height: 190,
                fit: BoxFit.cover
                ),
            ),
          ),
          SizedBox(height: 5,),
          Text(
            'lobo de Wall Street: totalmente fuera de si en consecuencia de su dinero',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}