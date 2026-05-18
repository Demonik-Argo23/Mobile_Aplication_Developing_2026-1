import 'package:flutter/material.dart';
import 'package:peliculas_app/models/cast.dart';

class CastingCardWidget extends StatelessWidget {
  final List<Cast> casts;
  const CastingCardWidget({super.key, required this.casts});

  @override
  Widget build(BuildContext context) {
    if (casts.isEmpty) {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        width: double.infinity,
        height: 160,
        child: Center(child: Text('No cast info available')),
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 160,
      child: ListView.builder(
        itemCount: casts.length,
        itemBuilder: (_, int index) {
          return CastCard(cast: casts[index]);
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class CastCard extends StatelessWidget {
  final Cast cast;
  const CastCard({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 180,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: cast.fullProfilePath == null 
              ? Image.asset(
                  'assets/NoImage.png',
                  height: 130,
                  width: 100,
                  fit: BoxFit.cover,
                )
              : FadeInImage(
                  placeholder: AssetImage('assets/NoImage.png'),
                  image: NetworkImage(cast.fullProfilePath!),
                  height: 130,
                  width: 100,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/NoImage.png',
                      height: 130,
                      width: 100,
                      fit: BoxFit.cover,
                    );
                  },
                ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Text(
              cast.name, 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), 
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            )
          ),
        ],
      ),
    );
  }
}
