// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:moviesdemo/MoviesList/Models/Movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailScreen(this.movie);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movie.title!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: getData(),
    );
  }

  Widget getData() {
    return Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            const Text(
              "Movie Overview:-",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(widget.movie.overview!),
            const Divider(
              thickness: 2,
            ),
            const Text(
              " Movie Popularity:-",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(widget.movie.popularity!.toString()),
            const Divider(
              thickness: 2,
            ),
            const Text(
              "Is this Adult Content",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(widget.movie.adult!.toString()),
            Divider(
              thickness: 2,
            ),
            const Text(
              "Original Language",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(widget.movie.originalLanguage.toString()),
            Divider(
              thickness: 2,
            ),
            const Text(
              " Release Date",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(widget.movie.releaseDate.toString()),
            Divider(
              thickness: 2,
            ),
            const Text(
              "Number of Vote Count",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(widget.movie.voteCount.toString()),
            Divider(
              thickness: 2,
            )
          ],
        ));
  }
}
