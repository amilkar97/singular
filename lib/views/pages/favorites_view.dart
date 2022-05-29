

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singular/controllers/network_controller.dart';
import 'package:singular/controllers/photo_controller.dart';
import 'package:singular/models/photo.dart';
import 'package:singular/views/widgets/nodata.dart';
import 'package:singular/views/widgets/photo_card.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final photoController = Provider.of<PhotoController>;
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(Provider.of<NetworkController>(context,listen: false).connection == false){
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(horizontal: 20),
              content: Text('Cargando datos locales'),
            backgroundColor: Colors.lightGreen,
          ));
      }
    });
    photoController(context,listen: false).getFavorites();
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  hintText: 'Search by username, name'
              ),
            ),
          ),
          Expanded(child: Consumer<PhotoController>(builder: (context, value, child) {
            if(value.isFavoritesLoading) return const Center(child: CircularProgressIndicator(),);
            if(value.favorites.isEmpty) return const NoData();
            return _buildList(value.favorites, context);
          },))
        ],
      ),
    );
  }

  _buildList(List<Photo> photos, BuildContext context){
    List<Photo> results = photos;
    if (_searchText.isNotEmpty) {
      List<Photo> tempList = [];
      for (int i = 0; i < photos.length; i++) {
        if (photos[i].user.username.toLowerCase().contains(_searchText.toLowerCase()) || photos[i].user.name.toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(photos[i]);
        }
      }
      if(tempList.isEmpty) return const NoData();
      results = tempList;
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return PhotoCard(photo:results[index], context:context);
      },);
  }
}
