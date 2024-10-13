import 'package:hive/hive.dart';

part 'app_language.g.dart';

@HiveType(typeId: 1)
enum AppLanguage {
  @HiveField(0)
  en('EN'),
  @HiveField(1)
  hu('HU'),;

  final String label;
  const AppLanguage(this.label);


}