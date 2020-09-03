import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movies_app/BusinessLogic/MovieBusinessLogic.dart';
import 'package:movies_app/Models/MovieModel.dart';
import 'package:movies_app/Models/ResultModel.dart';
import 'package:movies_app/Screens/MovieDetails.dart';

import '../Constants.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  Map<String, dynamic> map;
  MovieBusinessLogic movieBusinessLogic;
  int currentPage = 1;
  int totalPages = 0;
  bool isLoading;


  @override
  void initState() {
    print('Build Context: $context');
    movieBusinessLogic = MovieBusinessLogic();
    isLoading = true;
    loadData();
    super.initState();
  }


  loadData({int page = 1}) async{
    movieBusinessLogic.getMovies(context,page: page).then((value){
      setState(() {
        map = value;
        if(map['result'] != null){
          totalPages = map['result'].totalPages;
          currentPage = map['result'].page;
        }
        isLoading = false;
      });
    });
  }

  updatePage(ResultModel resultModel){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        currentPage = resultModel.page;
        totalPages = resultModel.totalPages;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Rated Movies"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : map['errorMsg'] != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${map['errorMsg']}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Divider(),
                      IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () => loadData())
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Total Pages: $totalPages"),
                            Text("Current Page: $currentPage"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => MovieCard(
                                movieModel: map['result'].results[index],
                              ),
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.green,
                          ),
                          itemCount: map['result'].results.length),
                    ),
                    Container(
                      color: Colors.blueGrey,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: (currentPage == 1)
                                ? null
                                : () {
                                      loadData(page: --currentPage);
                                  },
                            icon: Icon(Icons.chevron_left),
                          ),
                          IconButton(
                            onPressed: (currentPage == totalPages)
                                ? null
                                : () {
                                    loadData(page: ++currentPage);
                                  },
                            icon: Icon(Icons.chevron_right),
                          )
                        ],
                      ),
                    )
                  ],
                ),
    );
  }
}


class MovieCard extends StatelessWidget {
  final MovieModel movieModel;

  MovieCard({this.movieModel}) : assert(movieModel != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MovieDetails(movieModel))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                "${Constants.IMAGE_URL}${movieModel.posterPath}",
                height: 100,
                width: 100,
              ),
              Text(
                "${movieModel.title}",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

