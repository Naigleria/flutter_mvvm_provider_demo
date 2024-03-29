import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/movie.dart';
import 'package:flutterapp/screens/movie_list_screen.dart';
import 'package:flutterapp/services/webservice.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MovieListViewModel extends ChangeNotifier {

  List<Movie> movies = <Movie>[];
  int pageCount=0;
  bool isLoading=true;
  bool isSearching=false;
  int currentPage=1;


  void initLoading(){
    isLoading=true;
    notifyListeners();
  }
  void revertSearch(){
    isSearching=!isSearching;
    notifyListeners();
  }

  Future<void> fetchObjects(bool search, String query, int index, ) async {

    final data = search?
      await Webservice().fetchObjects(true,query,index):
      await Webservice().fetchObjects(false,query,index);

    this.pageCount=data["total_pages"];
    this.currentPage=index+1;
    final Iterable json = data["results"];
    this.movies=json.map((movie) => Movie.fromJson(movie)).toList();
    this.movies = this.movies.map((item) => Movie(
      LocalAdult: item.adult,
      LocalBackdropPath: item.backdropPath,
      LocalTitle: item.title,
      LocalOverview: item.overview,
      LocalPosterPath: item.posterPath,
      LocalReleaseDate: item.releaseDate,
      LocalPopularity: item.popularity,
      LocalRating: item.rating,
    )).toList();

    isLoading=false;
    notifyListeners();


  }

  void LaunchGeneralDialogMovieDetails(BuildContext context, Movie movie){
    showGeneralDialog (
      context: context,
      barrierColor: Colors.white,
      barrierDismissible: false,
      barrierLabel: "Titulo",
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (BuildContext contex, Animation animation, Animation secondAnimation){
        return StatefulBuilder(
          builder: (BuildContext context, setState1) {

            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(40.0),
                child: AppBar(
                  backgroundColor: Colors.lightBlue,
                  title: Text(
                    //AppLocalizations.of(context).translate('first_string'),
                    'Detalles de la película',
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: movie.posterPath!=""?
                      BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(movie.posterPath)
                        ),
                      ):null,
                      height: MediaQuery.of(context).size.height*0.33,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10.0,),
                        Flexible(
                          child: Container(
                            child: Text(movie.title,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        SizedBox(width: 10.0,),
                        Text("Fecha de estreno: "+movie.releaseDate,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        SizedBox(width: 10.0,),
                        Text("Popularidad: "+movie.popularity.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Icon(
                          CupertinoIcons.checkmark_seal_fill,
                          color: Colors.green,
                          size: 20.0,
                        )
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        SizedBox(width: 10.0,),
                        Text("Rating: "+movie.rating.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Icon(
                          CupertinoIcons.star_fill,
                          color: Colors.yellow.shade600,
                          size: 20.0,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(movie.overview,

                      ),
                    )
                  ],
                ),
              )

            );
          }
        );
      }
    );
  }

}

