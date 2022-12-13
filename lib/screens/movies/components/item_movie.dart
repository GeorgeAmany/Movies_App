import 'package:flutter/material.dart';
import 'movie_details.dart';

class ItemMovie extends StatefulWidget {
  final String imageUrl,imageUrll, title ,isAdult ,language , titleOfMovie , description;
  final num popularity ;

  const ItemMovie({Key? key, required this.imageUrl, required this.title, required this.isAdult, required this.imageUrll, required this.language, required this.titleOfMovie, required this.description, required this.popularity})
      : super(key: key);

  @override
  State<ItemMovie> createState() => _ItemMovieState();
}

class _ItemMovieState extends State<ItemMovie> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>  MovieDetails(
                  imageUrll: widget.imageUrll,
                  isAdult: widget.isAdult,
                  language: widget.language,
                  titleOfMovie: widget.titleOfMovie,
                  description: widget.description,
                  popularity: widget.popularity),
            ),
          );
        },
        child: SizedBox(
          height: 300,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                height: 300,
                width: 500,
                child: Image.network(
                    'https://image.tmdb.org/t/p/original/${widget.imageUrl}',
                    fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 160, start: 0),
                child: Container(
                  color: Colors.red.withOpacity(.6),
                  height: 30,
                  width: double.infinity,
                  child: Text(
                    widget.title,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
