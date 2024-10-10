import 'package:hive_flutter/hive_flutter.dart';

import '../features/movies/domain/entity/movie.dart';

late final Box<Movie> movieBox;

Future<void> hiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  movieBox = await Hive.openBox<Movie>('Movies');
}
