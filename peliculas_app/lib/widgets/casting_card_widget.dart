import 'package:flutter/material.dart';

class CastingCardWidget extends StatelessWidget {
  const CastingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 160,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, int index) {
          return CastCard();
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class CastCard extends StatelessWidget {
  const CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 110,
      height: 180,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('NoImage.png'),
              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5KFmhRD3es2Png8_oKz8TjCbxLYuZhOc7Wg&s'),
            ),
          ),
          SizedBox(height: 5,),
          Expanded(child: Text('Goku', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,)),
        ],
      ),
    );
  }
}
