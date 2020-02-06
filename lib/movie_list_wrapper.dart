class MovieListWrapper {
  int isError;
  int errorType;
  String errorMessage;
  Result result;

  MovieListWrapper({this.isError, this.errorType, this.errorMessage, this.result});

  MovieListWrapper.fromJson(Map<String, dynamic> json) {
    isError = json['isError'];
    errorType = json['errorType'];
    errorMessage = json['errorMessage'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isError'] = this.isError;
    data['errorType'] = this.errorType;
    data['errorMessage'] = this.errorMessage;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  List<MovieList> movieList;

  Result({this.movieList});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['movieList'] != null) {
      movieList = new List<MovieList>();
      json['movieList'].forEach((v) {
        movieList.add(new MovieList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movieList != null) {
      data['movieList'] = this.movieList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieList {
  int movieId;
  String movieName;

  MovieList({this.movieId, this.movieName});

  MovieList.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId'];
    movieName = json['movieName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movieId'] = this.movieId;
    data['movieName'] = this.movieName;
    return data;
  }
}

