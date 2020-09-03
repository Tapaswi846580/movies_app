import 'package:flutter/material.dart';
import 'package:movies_app/Constants.dart';
import 'package:movies_app/Models/MovieModel.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movieModel;

  MovieDetails(this.movieModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${movieModel.originalTitle}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                "${Constants.IMAGE_URL}${movieModel.backdropPath}",
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("${movieModel.overview}", textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20,),),
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Release Date: ${movieModel.releaseDate}",
                            style: TextStyle(fontSize: 17),),

                          SizedBox(
                            width: 15,
                          ),

                          Text("Original Language: ${movieModel.originalLanguage}",
                            style: TextStyle(fontSize: 17),),
                        ],
                      ),
                    ),

                    Divider(),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text("Popularity: ${movieModel.popularity}",
                            style: TextStyle(fontSize: 17),),

                          SizedBox(
                            width: 60,
                          ),

                          Text("Vote Count: ${movieModel.voteCount}",
                            style: TextStyle(fontSize: 17),),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

