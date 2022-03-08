import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRFR-fnEEIeA-1AYwIXRkfWa9bLUJyXBPDbvlCQi_dulsr41NXv',
  'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRrmuWJLypZIsZC7yKIMPxxF45UYkJLv5Kg2i5AFcsWuGJnlMPR',
  'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSsifNBbCd9akddbx7-cIBMNVyZ2TXCR5ptbIx9M9_lt0KhRp6M',
  'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRfvH2H9UjJynuHhTa30puUVB_k2wdPudW4IjXk2U6gACTrHuhw'
];

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Container(
              height: 50,
              constraints: BoxConstraints(minWidth: 100, maxWidth: 450),
              padding: EdgeInsets.fromLTRB(45, 8, 45, 8),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Text("Peliculas en cartelera", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 500.0,
                viewportFraction: 0.8,
                enableInfiniteScroll: false,
                autoPlayInterval: Duration(seconds: 3),
                scrollDirection: Axis.horizontal
              ),
              items: imgList.map(( item ) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 5, 20),
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(20), // Image border
                            child: SizedBox.fromSize(
                              size: Size.infinite, // Image radius
                              child: Image.network(item, fit: BoxFit.cover),
                            ),
                          ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 20, 5, 20),
                          child: Row(
                            children: [
                              Expanded(child: Text('Spider-Man: No Way Home', textAlign: TextAlign.start, style: TextStyle(fontSize: 18), ), flex: 4),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Row(children: [Padding(child: StartIcon(), padding: EdgeInsets.only(right: 5),), Text('7.4')], mainAxisAlignment: MainAxisAlignment.end),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFbc62ff),
                                        borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      child: Text("Acción / Aventura", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))
                                    ),                    
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              }).toList(),
            )
          ],),
        ),
      ),
    );
  }
}

class StartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      size: 20,
      color: Colors.yellow[500],
    );
  }
}
