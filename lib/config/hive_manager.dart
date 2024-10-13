import 'package:applion/app/app_language.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../features/movies/domain/entity/movie.dart';

late final Box<dynamic> preferencesBox;
late final Box<Movie> movieBox;


Future<void> hiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  Hive.registerAdapter(AppLanguageAdapter());
  movieBox = await Hive.openBox<Movie>('Movies');
  preferencesBox = await Hive.openBox('preferences');
}

class PrefConstants {
  static const String language = 'language';
}



