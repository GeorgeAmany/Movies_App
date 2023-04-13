import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';

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
    int _index = 1;
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
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "$titleOfMovie ",
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/original/$imageUrll'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.amber,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Icon(
                      Icons.share,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Film for adult : $isAdult",
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 10,
              ),
              Text("Language of this film : $language ",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Description : $description",
                  style: const TextStyle(color: Colors.amber, fontSize: 20),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
