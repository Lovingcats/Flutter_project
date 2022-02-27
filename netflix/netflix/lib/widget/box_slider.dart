import 'package:flutter/material.dart';
import 'package:netflix/model/model_movie.dart';
import 'package:netflix/screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  BoxSlider({required this.movies});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('지금 보는 컨텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImage(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImage(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  movie: movies[i],
                );
              }),
        );
      },
      child: Container(
          padding: EdgeInsets.only(right: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset('images/' + movies[i].poster),
          )),
    ));
  }
  return results;
}
