import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_app/Models/ResultModel.dart';
import 'package:movies_app/repository/MovieRepository.dart';

class MovieBusinessLogic{

  Future<Map<String,dynamic>> getMovies(BuildContext context, {int page = 1}) async{
    Map<String, dynamic> map;
    try{
      ResultModel resultModel = await MovieRepository.getInstance().getTopRatedMovies(page: page);
      if (resultModel == null)
        map = {
          'errorMsg': 'Result Null:( Something went wrong, please try again'
        };
      else
        map = {'result': resultModel};
    }on TimeoutException catch(e){
      _errorAlert(context,e.message);
      map = {'errorMsg': '${e.message}'};
    }on SocketException catch(e){
      _errorAlert(context,e.message);
      map = {'errorMsg': '${e.message}'};
    }on Exception catch(e){
      _errorAlert(context,e.toString());
      map = {'errorMsg': '${e.toString()}'};
    }
    return map;
  }

  _errorAlert(BuildContext context, String message){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('$message'),
          actions: [
            FlatButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Dismiss"))
          ],
        )
    );
  }

}