import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movies_bloc.dart';
import '../bloc/movies_event.dart';
import '../bloc/movies_state.dart';
class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: BlocProvider(
        create: (context) => MoviesBloc()..add(MoviesEventFetch()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is MoviesStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MoviesStateLoaded) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return ListTile(
                    title: Text(movie.title),
                    subtitle: Text(movie.details),
                  );
                },
              );
            } else if (state is MoviesStateError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Error'));
          },
        ),
      ),
    );
  }
}