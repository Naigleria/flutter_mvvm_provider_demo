import 'package:flutter/material.dart';

class GeneralAppInfo with ChangeNotifier{

  String _catalogMovie='Catálogo de películas';

  String get catalogMovie{
    return _catalogMovie;
  }

  set catalogMovie(String value){
    this._catalogMovie=value;
    notifyListeners();
  }
}