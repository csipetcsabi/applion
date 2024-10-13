import 'package:applion/app/app_language.dart';

sealed class MoviesEvent {}

class MoviesEventFetch extends MoviesEvent {
  String query;

  MoviesEventFetch({required this.query});

}

class MoviesEventChangeLanguage extends MoviesEvent {
  final AppLanguage language;

  MoviesEventChangeLanguage({required this.language});
}
