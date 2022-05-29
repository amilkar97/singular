



import 'package:singular/models/photo.dart';
import 'package:singular/repository/interface.dart';
import 'package:hive/hive.dart';

class LocalData implements MyDataRepository{

  @override
  Future<List<Photo>> getFavorites() async {
    List<Photo> photos = [];
    var box = await Hive.openBox('hive');
    if (box.get('favorites') != null) {
      List list = box.get('favorites');
      for (var element in list) {
        photos.add(element);
      }
    }
    return photos;
  }

  @override
  Future<bool> setFavorite(Photo photo) async {
    try{
      List<Photo> currentFavorites = await getFavorites();
      photo
        ..liked_by_user = true
        ..likes += 1;
      currentFavorites.add(photo);
      var box = await Hive.openBox('hive');
      box.put('favorites', currentFavorites);
      return true;
    }catch(error){
      return false;
    }
  }

  @override
  Future<bool> unSetFavorite(Photo photo) async{
    try{
      List<Photo> currentFavorites = await getFavorites();
      currentFavorites.removeWhere((element) => element.id  == photo.id);
      var box = await Hive.openBox('hive');
      box.delete('favorites');
      box.put('favorites', currentFavorites);
      return true;
    }catch(error){
      return false;
    }
  }

}