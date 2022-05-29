
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:singular/controllers/network_controller.dart';
import 'package:singular/controllers/photo_controller.dart';
import 'package:singular/views/widgets/custom_inherited/try_inherited_widget.dart';
import 'package:singular/views/widgets/nodata.dart';
import 'package:singular/views/widgets/nointernet.dart';
import 'package:singular/views/widgets/photo_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool hasConnection = false;
  String oldValue = '';

  @override
  void initState(){
    super.initState();

    _loadData();
    _searchController.addListener(() async{
        if(_searchController.text != oldValue){
          await Provider.of<PhotoController>(context,listen: false).searchByUsernameOrName(query: _searchController.text,false);
          oldValue = _searchController.text;
        }
    });
  }

  _loadData() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      hasConnection = true;
      Provider.of<PhotoController>(context, listen: false).page = 1;
      await Provider.of<PhotoController>(context, listen: false).getPhotos(false);
    } else {
      hasConnection = false;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 20),
        content: Text('No hay internet'),
        backgroundColor: Colors.redAccent,
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyInheritedWidgetToTry(
          tryFunction: (){
            _loadData();
          },
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
              Expanded(child: Consumer2<NetworkController, PhotoController>(builder: (context, networkController, photoController, child) {
                  if(networkController.connection == false) return NoInternet(context: context);
                  if(photoController.isPhotosLoading) return const Center(child: CircularProgressIndicator(),);
                  if(photoController.photos.isEmpty) return const NoData();
                  return ListView.builder(
                    itemCount: photoController.photos.length,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      if(index == photoController.photos.length - 1){
                        Provider.of<PhotoController>(context,listen: false).getPhotos(true);
                      }
                      if(index + 1 == photoController.photos.length) return const Center(child: CircularProgressIndicator(),);
                      return PhotoCard(photo: photoController.photos[index],context: context,);
                    },);

              },)),
            ],
          ),
        ),
      ),
    );
  }

}

