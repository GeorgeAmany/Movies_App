
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final String imageUrll , isAdult , language ,titleOfMovie ,description ;
  final num popularity ;
  const MovieDetails({Key? key, required this.imageUrll, required this.isAdult, required this.language, required this.titleOfMovie, required this.description, required this.popularity}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
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
          padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Image(
                image: NetworkImage('https://image.tmdb.org/t/p/original/${widget.imageUrll}'),
              ),
              const SizedBox(height: 10,),
              Text("Film for adult : ${widget.isAdult}",
                  style: const TextStyle(color: Colors.blue, fontSize: 25),
                  textAlign: TextAlign.start),
              const SizedBox(height: 10,),
              Text("Language of this film : ${widget.language} ",
                  style: const TextStyle(color: Colors.amber, fontSize: 20),
                  textAlign: TextAlign.start),
              const SizedBox(height: 10,),
              Text("Title of this film : ${widget.titleOfMovie} ",
                  style: const TextStyle(color: Colors.blue, fontSize: 25),
                  textAlign: TextAlign.start),
              const SizedBox(height: 10,),
              Text("Description : ${widget.description}",
                  style: const TextStyle(color: Colors.amber, fontSize: 20),
                  textAlign: TextAlign.start),
              const SizedBox(height: 10,),
              Text("Popularity : ${widget.popularity}",
                  style: const TextStyle(color: Colors.blue, fontSize: 25),
                  textAlign: TextAlign.start),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
