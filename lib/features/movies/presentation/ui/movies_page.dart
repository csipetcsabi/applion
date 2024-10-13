import 'package:applion/features/movies/domain/entity/movie.dart';
import 'package:applion/features/movies/presentation/ui/movie_detals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app_language.dart';
import '../../../../util/movie_util.dart';
import '../bloc/movies_bloc.dart';
import '../bloc/movies_event.dart';
import '../bloc/movies_state.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Movies')),
      ),
      body: Column(
        children: [
          searchField(context),
          Expanded(child: listOfMovies(context)),
        ],
      ),
    );
  }

  Widget searchField(context) {
    return Builder(builder: (context) {
      return SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    fillColor: Color(0xFFF4F4F4),
                    labelText: 'Search',
                    labelStyle: TextStyle(color: Color(0x00b2b2b2)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onChanged: (query) {
                    context
                        .read<MoviesBloc>()
                        .add(MoviesEventFetch(query: query));
                  },
                ),
              ),
              Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.language),
                  onPressed: () {
                    _showLanguageDialog(context);
                  },
                );
              }),
            ],
          ),
        ),
      );
    });
  }

  void _showLanguageDialog(BuildContext buildContext) {
    showDialog(
      context: buildContext,
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<MoviesBloc>(buildContext),
          child: AlertDialog(
            title: const Text('Select Language'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                languageTile(buildContext, AppLanguage.en),
                languageTile(buildContext, AppLanguage.hu),
              ],
            ),
          ),
        );
      },
    );
  }

  ListTile languageTile(BuildContext buildContext, AppLanguage language) {
    return ListTile(
      title: Text(language.label),
      onTap: () {
        buildContext
            .read<MoviesBloc>()
            .add(MoviesEventChangeLanguage(language: language));
        Navigator.of(buildContext).pop();
      },
    );
  }

  Widget listOfMovies(context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesStateInitial) {
          return const Center(child: Text('Search for movies'));
        } else if (state is MoviesStateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MoviesStateLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              final movie = state.movies[index];
              return createListItems(movie, context);
            },
          );
        } else if (state is MoviesStateError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('Error'));
      },
    );
  }

  Widget createListItems(Movie movie, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MovieDetails(movie)));
          //context.read<MoviesBloc>().add(MoviesEventFetch());
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: MovieUtil.getNetworkImage(movie),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: SizedBox(
                      //  width: 200,
                      child: Text(
                        movie.title ?? '-',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text(
                        movie.voteAverage.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.yellow,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.heart_broken_outlined,
                          color: Colors.red),
                      Text(
                        movie.voteCount.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: SizedBox(
                      child: Text(
                        movie.overview ?? '-',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
