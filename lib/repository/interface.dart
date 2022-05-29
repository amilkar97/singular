

import 'package:singular/models/photo.dart';

abstract class MyDataRepository{

  Future<List<Photo>> getFavorites();

  Future<bool> setFavorite(Photo photo);

  Future<bool> unSetFavorite(Photo photo);
}