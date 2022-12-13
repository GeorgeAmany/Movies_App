import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'components/item_movie.dart';
import 'model.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Movies'),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: Dio().get(
            'https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final model = MoviesData.fromJson(snapshot.data!.data);
            return GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => ItemMovie(
                imageUrl: model.movies[index].backdropPath,
                title: model.movies[index].title,
                isAdult: model.movies[index].adult.toString(),
                imageUrll: model.movies[index].backdropPath,
                language: model.movies[index].originalLanguage,
                titleOfMovie: model.movies[index].title,
                description: model.movies[index].overview,
                popularity: model.movies[index].voteAverage,
              ),
              itemCount: model.movies.length,
            );
          } else {
            return const Center(child: RefreshProgressIndicator());
          }
        },
      ),
    );
  }
}
