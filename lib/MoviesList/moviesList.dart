// ignore_for_file: file_names, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:moviesdemo/MoviesList/bloc.dart';

import '../MovieDetailscreen.dart';
import 'Models/Movie.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final MoviesListBLOC _bloc = MoviesListBLOC.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: getMoviesList(),
    );
  }

  Widget getMoviesList() {
    return FutureBuilder<List<Movie>>(
        future: _bloc.getMoviesList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailScreen(snapshot.data![index])));
                      },
                      leading: Text("${index + 1}."),
                      title: Text(snapshot.data![index].title!),
                    ),
                  );
                });
          }
        });
  }
}
