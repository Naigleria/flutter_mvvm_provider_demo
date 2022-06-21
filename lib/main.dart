import 'package:flutter/material.dart';
import 'package:flutterapp/providers/generalAppInfo.dart';
import 'package:flutterapp/view%20models/movie_list_view_model.dart';
import 'package:provider/provider.dart';

import 'pages/movie_list_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>GeneralAppInfo()),
      ],
      child: MaterialApp(
        title: "Movies",
        debugShowCheckedModeBanner: false,
        home:
        ChangeNotifierProvider(
          create: (context) => MovieListViewModel(),
          child: MovieListPage(),
        )
      ),
    );
  }

}