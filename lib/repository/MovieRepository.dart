import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:movies_app/Constants.dart';
import 'package:movies_app/Models/MovieModel.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/Models/ResultModel.dart';

class MovieRepository{

  static final MovieRepository _singleton = MovieRepository._internal();

  /*
  * private constructor to make a singleton object
  * */
  MovieRepository._internal();

  static MovieRepository getInstance() {
    return _singleton;
  }

  Future<ResultModel> getTopRatedMovies({int page = 1}) async{
    ResultModel result;
    try{
      http.Response response = await http
          .get("${Constants.TOP_RATED_MOVIES}$page")
          .timeout(Duration(seconds: 20));
      var responseJson = jsonDecode(response.body);
      if(response.statusCode.isBetween(200, 299)){
        result = ResultModel.fromJson(responseJson);
      }
    }on TimeoutException{
      throw TimeoutException("Server timed out 🙁");
    }on SocketException{
      throw SocketException("Server cannot be reached 🙁");
    }on Exception {
      throw Exception("Something went wrong, please try again. 🙁");
    }
    return result;
  }

}


extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}
extension on int{
  bool isBetween(int lowerBound, int upperBound){
    return (this >= lowerBound && this <= upperBound);
  }
}