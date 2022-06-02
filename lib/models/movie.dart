class Movie {

  final bool LocalAdult;
  final String LocalBackdropPath;
  final String LocalTitle;
  final String LocalOverview;
  final String LocalPosterPath;
  final String LocalReleaseDate;
  final num LocalPopularity;
  final num LocalRating;


  Movie({this.LocalAdult, this.LocalBackdropPath, this.LocalTitle, this.LocalOverview, this.LocalPosterPath, this.LocalReleaseDate, this.LocalPopularity, this.LocalRating});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      LocalAdult: json["adult"],
      LocalBackdropPath: json["backdrop_path"],
      LocalTitle: json['title'],
      LocalOverview: json['overview'],
      LocalPosterPath: json['poster_path'],
      LocalReleaseDate: json['release_date'],
      LocalPopularity: json['popularity'],
      LocalRating: json['vote_average']
    );
  }

  bool get adult {
    return this.LocalAdult;
  }

  String get backdropPath {
    return 'https://image.tmdb.org/t/p/w500'+this.LocalBackdropPath;
  }

  String get title {
    return this.LocalTitle;
  }

  String get overview {
    return this.LocalOverview;
  }

  String get posterPath {
    return 'https://image.tmdb.org/t/p/w500'+this.LocalPosterPath;
  }

  String get releaseDate {
    return this.LocalReleaseDate;
  }

  num get popularity {
    return this.LocalPopularity;
  }

  num get rating{
    return this.LocalRating;
  }

}