
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:singular/repository/local_data_implementation.dart';
import 'package:singular/services/photo_service.dart';
import 'package:dio/dio.dart';
import '../models/photo.dart';

class PhotoController extends ChangeNotifier {
  String? errorMessage = '';
  bool isPhotosLoading = false;
  bool isFavoritesLoading = false;
  int page = 1;
  List<Photo> photos = [];
  List<Photo> favorites = [];
  final photoService = PhotoService.instance();
  Timer? timer;

  getPhotos(bool getMore) async{
    try{
      if(getMore){
        page++;
      }else{
        photos.clear();
        isPhotosLoading = true;
      }
      List<Photo>  photoResponse = await photoService.getPhotos(page: page);
      photos.addAll(photoResponse);
      List<Photo> tempFavorites = await LocalData().getFavorites();
      if(tempFavorites.isNotEmpty){
        for (var favorite in tempFavorites) {
         // print(favorite.id);
            if(photos.any((element) => element.id == favorite.id)){
              photos.firstWhere((photo) => photo.id == favorite.id)
                ..liked_by_user = true
                ..likes += 1;
            }
        }
      }
      //print(photos.first.id);
      isPhotosLoading = false;
      notifyListeners();
    }catch(error){
      if(error is DioError){
        if(error.response != null){
          switch (error.response!.statusCode){
            case 500:
              errorMessage = 'Error del servidor';
              break;
            case 401:
              //reAuth
              errorMessage = 'No estas autenticado';
              break;
          }
        }
        notifyListeners();
      }
    }
  }

  searchByUsernameOrName(bool getMore,{required String query}) async{
      if(getMore){
        page++;
      }else{
        photos.clear();
      }

      isPhotosLoading = true;
      notifyListeners();
      if(timer != null){
          timer!.cancel();
        }
        if(query.isNotEmpty && query != '' && !query.contains(' ')){
          timer = Timer(const Duration(milliseconds: 300),() {
            photoService.searchPhotos(query, page: page)
              ..then((value) async{
                List<Photo>  photoResponse = value;

                photos.addAll(photoResponse);
                List<Photo> tempFavorites = await LocalData().getFavorites();
                if(tempFavorites.isNotEmpty){
                  for (var favorite in tempFavorites) {
                    if(photos.any((element) => element.id == favorite.id)){
                      photos.firstWhere((photo) => photo.id == favorite.id)
                      ..liked_by_user = true
                      ..likes += 1;
                    }
                  }
                }
              })
              ..then((value) {
                isPhotosLoading = false;
                notifyListeners();
              }).catchError((error) async{
                if(error is DioError){
                  switch (error.response!.statusCode) {
                    case 403:
                      errorMessage = 'Rate limit';break;
                    case 404:
                      photos.clear();
                      isPhotosLoading = false;
                      notifyListeners();
                      break;
                    case 500:
                      errorMessage = 'Error del servidor';
                      break;
                    case 401:
                      errorMessage = 'No estas autenticado';
                      break;
                  }
                }
              });
          });
        }else{
          photos = await photoService.getPhotos(page: 1);
          isPhotosLoading = false;
          notifyListeners();
        }
  }


  getFavorites() async{
    try{
      isFavoritesLoading = true;
      favorites.clear();
      //delay de 500 simula busqueda
      Future.delayed(const Duration(milliseconds: 500),() async{
        favorites = await LocalData().getFavorites();
        isFavoritesLoading = false;
        notifyListeners();
      });
    }catch(error){
      errorMessage = 'Algo ocurrio mal';
      notifyListeners();
    }
  }

  setFavorite(Photo photo) async{
    try{
      await LocalData().setFavorite(photo);
    }catch(error){
      errorMessage = 'Algo ocurrio mal';
      notifyListeners();
    }
  }

  unSetFavorite(Photo photo) async{
    try{
      bool response = await LocalData().unSetFavorite(photo);
      if(response){
        favorites.removeWhere((element) => element.id == photo.id);
        notifyListeners();
      }
    }catch(error){
      errorMessage = 'Algo ocurrio mal';
      notifyListeners();
    }
  }
}