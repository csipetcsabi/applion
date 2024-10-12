import 'package:applion/app/app_colors.dart';
import 'package:applion/features/movies/domain/entity/movie.dart';
import 'package:flutter/material.dart';

import '../../../../util/movie_util.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        getBody(),
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    ));
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                MovieUtil.getPosterPath(movie), // Replace with actual image URL
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title ?? "-",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        const SizedBox(width: 4),
                        Text(
                          movie.voteCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getTile('Status', getReleaseValue(movie.releaseDate)),
                      verticalDivider(),
                      getTile('Popularity', movie.popularity.toString()),
                      verticalDivider(),
                      getTile('Language', movie.originalLanguage ?? "")
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                getChipsRow(movie),
                const SizedBox(height: 16),
                const Text(
                  "When a kid accidentally triggers the universe's most lethal hunters' return to Earth, only a ragtag crew of ex-soldiers and a disgruntled female scientist can prevent the end of the human race.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getChipsRow(Movie movie) {
    return Row(
      children:
          movie.genreIds.map((item) => getChip(item.toString())).toList(),
    );
  }

  Widget getTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value),
      ],
    );
  }

  Widget getChip(String label) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4),
        ),
        height: 24,
        child: Center(
            child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ))),
      ),
    );
  }

  Widget verticalDivider() {
    return VerticalDivider(
      color: AppColors.lightGray,
      thickness: 1,
      indent: 6,
      endIndent: 6,
    );
  }

  String getReleaseValue(String? releaseDate) {
    if (releaseDate == null) {
      return "Unknown";
    }
    DateTime dateTime;
    try {
      dateTime = DateTime.parse(releaseDate);
    } catch (e) {
      return 'Invalid date';
    }
    if (dateTime.isBefore(DateTime.now())) {
      return 'Released';
    } else {
      return 'Upcoming';
    }
  }
}
