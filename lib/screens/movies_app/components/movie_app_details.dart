import 'package:flutter/material.dart';

class MovieAppDetails extends StatelessWidget {
  final String imageUrll, isAdult, language, titleOfMovie, description;
  final num popularity;

  const MovieAppDetails(
      {Key? key,
      required this.imageUrll,
      required this.isAdult,
      required this.language,
      required this.titleOfMovie,
      required this.description,
      required this.popularity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Movie Details'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/original/$imageUrll'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Film for adult : $isAdult",
                  style: const TextStyle(color: Colors.blue, fontSize: 25),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 10,
              ),
              Text("Language of this film : $language ",
                  style: const TextStyle(color: Colors.amber, fontSize: 20),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 10,
              ),
              Text("Title of this film : $titleOfMovie ",
                  style: const TextStyle(color: Colors.blue, fontSize: 25),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 10,
              ),
              Text("Description : $description",
                  style: const TextStyle(color: Colors.amber, fontSize: 20),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 10,
              ),
              Text("Popularity : $popularity",
                  style: const TextStyle(color: Colors.blue, fontSize: 25),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
