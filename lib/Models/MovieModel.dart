

class MovieModel{
  int _id;
  String _posterPath;
  bool _isAdult;
  String _overview;
  String _releaseDate;
  List<int> _genreIds;
  String _originalTitle;
  String _originalLanguage;
  String _title;
  String _backdropPath;
  var _popularity;
  int _voteCount;

  MovieModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _posterPath = json['poster_path'],
        _isAdult = json['adult'],
        _overview = json['overview'],
        _releaseDate = json['release_date'],
        _genreIds = json['genre_ids'].cast<int>(),
        _originalTitle = json['original_title'],
        _originalLanguage = json['original_language'],
        _title = json['title'],
        _backdropPath = json['backdrop_path'],
        _popularity = json['popularity'],
        _voteCount = json['vote_count'];

  int get voteCount => _voteCount;

  get popularity => _popularity;

  String get backdropPath => _backdropPath;

  String get title => _title;

  String get originalLanguage => _originalLanguage;

  String get originalTitle => _originalTitle;

  List<int> get genreIds => _genreIds;

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get isAdult => _isAdult;

  String get posterPath => _posterPath;

  int get id => _id;
}