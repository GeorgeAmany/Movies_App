import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/movies_app/model.dart';
import 'package:movie_app/screens/movies_app/states.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(MoviesInitialState());

  MoviesAppData? model;

  static MoviesCubit getObject(context) => BlocProvider.of(context);

  Future<void> getMoviesDetails() async {
    emit(GetMoviesLoadingState());

    final response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9');
    if (response.statusCode != 500 && response.statusCode != 404) {
      emit(GetMoviesSuccessState());
      model = MoviesAppData.fromJson(response.data);
    } else {
      emit(GetMoviesFailedState());
    }
  }
}
