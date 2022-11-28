
import 'package:flutter/material.dart';
import 'package:flutterapp/providers/generalAppInfo.dart';
import 'package:flutterapp/view%20models/movie_list_view_model.dart';
import 'package:flutterapp/widgets/movie_list.dart';
import 'package:flutterapp/appData.dart';
import 'package:flutterapp/widgets/paginator_list.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {

  final TextEditingController _controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded

    Provider.of<MovieListViewModel>(context, listen: false).fetchObjects(false,"",0);

  }
  @override
  Widget build(BuildContext context) {

    MovieListViewModel vm = Provider.of<MovieListViewModel>(context);
    final generalAppInfo = Provider.of<GeneralAppInfo>(context);

    return vm.isLoading?
    Scaffold(
      body:SafeArea(
        top: true,
        child: Container(
          color: Colors.black12,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      )
    ):
    Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: appData.primaryAppcolor1,
          title: Text(
            //AppLocalizations.of(context).translate('first_string'),
            generalAppInfo.catalogMovie,
          ),
          actions: [
            Visibility(
              visible: vm.isSearching? true : false,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  vm.initLoading();
                  vm.fetchObjects(false,"",0);
                  generalAppInfo.catalogMovie="Catálogo de películas";
                  vm.revertSearch();
                },
              ),
            ), //
          ],
        ),
      ),
      body:  Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                if(value.isNotEmpty) {
                  vm.initLoading();
                  vm.fetchObjects(true,value,0, );
                  _controller.clear();
                  vm.revertSearch();
                  generalAppInfo.catalogMovie="Resultados de búsqueda: "+value;
                }
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Buscar",
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none
              ),
            ),
          ),
          Expanded(
            child: MovieList(movies: vm.movies, vm:vm)
          ),
          Visibility(
            visible: vm.isSearching==true? false : true,
            child: PaginatorList(vm:vm)
          )
        ],
      )
    );
  }
}


