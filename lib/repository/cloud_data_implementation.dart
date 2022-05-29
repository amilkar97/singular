


import 'package:singular/models/photo.dart';
import 'package:singular/repository/interface.dart';

class CloudData implements MyDataRepository{

  @override
  Future<List<Photo>> getFavorites() {
    // must return the favorites photos of the cloud
    throw UnimplementedError();
  }

  @override
  Future<bool> setFavorite(Photo photo) {
    // must store a photo as favorite
    throw UnimplementedError();
  }

  @override
  Future<bool> unSetFavorite(Photo photo) {
    // must delete a Photo from favorites list
    throw UnimplementedError();
  }

}