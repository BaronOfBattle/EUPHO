// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:kkkk/home_screen.dart';
import 'movieratings.dart';

class HistoryScreen extends StatelessWidget {
  final List<MovieRating> movieRatings;

  const HistoryScreen({required this.movieRatings, required List movieRating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
        backgroundColor: Colors.blue,  // 
      ),
      body: ListView.builder(
        itemCount: movieRatings.length,
        itemBuilder: (context, index) {
          final movieRating = movieRatings[index];
          return ListTile(
            title: Text(movieRating.title),
            subtitle: Text(movieRating.synopsis),
            trailing: Text('Rating: ${movieRating.rating}'),
          );
        },
      ),
    );
  }
}
