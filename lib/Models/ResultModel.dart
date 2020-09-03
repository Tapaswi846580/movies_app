import 'MovieModel.dart';

class ResultModel {
  int _page;
  int _totalResult;
  int _totalPages;
  List<dynamic> _results;

  ResultModel.fromJson(Map<String, dynamic> json)
      : _page = json['page'],
        _totalResult = json['total_results'],
        _totalPages = json['total_pages'],
        _results = json['results'].map((movie) => MovieModel.fromJson(movie))
            .toList();

  List<dynamic> get results => _results;

  int get totalPages => _totalPages;

  int get totalResult => _totalResult;

  int get page => _page;


}
