
import 'package:flutter/material.dart';
import 'package:flutterapp/view%20models/movie_list_view_model.dart';
import '../models/movie.dart';

class MovieList extends StatelessWidget {

   List<Movie> movies;
   MovieListViewModel vm;
  MovieList({this.movies,  this.vm});



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (context, index) {

        var  movie = this.movies[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration:movie.backdropPath!=null?
            BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(movie.backdropPath)
              ),
              borderRadius: BorderRadius.circular(6)
            ):null,
            width: 50,
            height: 100,
            ),
          title: Text(movie.title),
          onTap: (){
            vm.LaunchGeneralDialogMovieDetails(context, movie);
          },
        );
      },
    );
  }
}