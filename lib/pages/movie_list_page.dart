
import 'package:flutter/material.dart';
import 'package:flutterapp/view%20models/movie_list_view_model.dart';
import 'package:flutterapp/widgets/movie_list.dart';

import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    Provider.of<MovieListViewModel>(context, listen: false).fetchMovies();
  }

  @override
  Widget build(BuildContext context) {

    MovieListViewModel vm = Provider.of<MovieListViewModel>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            //AppLocalizations.of(context).translate('first_string'),
            'Catálogo de películas',
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: <Widget>[
          /* Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                if(value.isNotEmpty) {
                  vm.fetchMovies(value);
                  _controller.clear();
                }
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none
              ),

            ),
          ), */
          Container(),
          Expanded(
            child: MovieList(movies: vm.movies, vm:vm))
        ])
      )

    );
  }
}