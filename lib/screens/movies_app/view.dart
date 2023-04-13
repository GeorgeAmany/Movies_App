import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/movies_app/cubit.dart';
import 'package:movie_app/screens/movies_app/states.dart';
import 'package:movie_app/utils/constants.dart';

import 'components/movie_app_details.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesCubit>(
      create: (context) => MoviesCubit(),
      child: Builder(
        builder: (context) {
          final cubit = MoviesCubit.getObject(context);
          cubit.getMoviesDetails();

          return Scaffold(
            backgroundColor: Colors.black.withOpacity(.8),
            appBar: AppBar(
              title: const Text('Movies'),
              centerTitle: true,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
              child: BlocBuilder<MoviesCubit, MoviesStates>(
                  builder: (context, state) {
                if (state is GetMoviesLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: SizedBox(
                              height: 300,
                              width: 500,
                              child: Image.network(
                                  'https://image.tmdb.org/t/p/original/${cubit.model!.movies[index].backdropPath}',
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 150, start: 5, end: 5, bottom: 5),
                            child: Container(
                              // color: Colors.red.withOpacity(.3),
                              color: kThemeColour.withOpacity(0.5),
                              height: 50,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  cubit.model!.movies[index].title,
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MovieAppDetails(
                            imageUrll: cubit.model!.movies[index].backdropPath,
                            isAdult:
                                cubit.model!.movies[index].adult.toString(),
                            language:
                                cubit.model!.movies[index].originalLanguage,
                            titleOfMovie: cubit.model!.movies[index].title,
                            description: cubit.model!.movies[index].overview,
                            popularity: cubit.model!.movies[index].voteAverage,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: cubit.model!.movies.length,
                );
              }),
            ),
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                indicatorColor: Theme.of(context).primaryColor,
                labelTextStyle: const MaterialStatePropertyAll(
                  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kMSWhite,
                  ),
                ),
              ),
              child: NavigationBar(
                elevation: 0,
                height: 60,
                backgroundColor: kMSWhite,
                // selectedIndex: _index,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                animationDuration: const Duration(seconds: 1),
                //use bloc and change index according
                // onDestinationSelected: (index) => setState(() {
                //   _index = index;
                // }),
                destinations: [
                  NavigationDestination(
                    icon: Icon(
                      Icons.space_dashboard_rounded,
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                    ),
                    selectedIcon: const Icon(
                      Icons.space_dashboard_rounded,
                      color: kMSWhite,
                    ),
                    label: "Dashboard",
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.home,
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                    ),
                    selectedIcon: const Icon(
                      Icons.home,
                      color: kMSWhite,
                    ),
                    label: "Home",
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.settings,
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                    ),
                    selectedIcon: const Icon(
                      Icons.settings,
                      color: kMSWhite,
                    ),
                    label: "Settings",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
