

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:singular/controllers/photo_controller.dart';
import 'package:singular/views/pages/photo_view.dart';
import 'package:singular/views/pages/user_view.dart';
import '../../models/photo.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;
  final BuildContext context;
  const PhotoCard({Key? key, required this.photo, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoView(photo: photo),)),
              child: CachedNetworkImage(
                imageUrl: photo.urls.full,
                cacheKey: photo.id,
                placeholder: (context,_){
                  return AspectRatio(
                    aspectRatio: 16/9,
                    child: Shimmer(
                      gradient: const LinearGradient(colors: [Colors.white,Colors.black45]),
                      child: Container(
                        color: Colors.black,
                        alignment: Alignment.center,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, widget){
                    return const AspectRatio(aspectRatio: 16/9,child: Icon(Icons.error_outline),);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserView(user: photo.user),)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: CachedNetworkImageProvider(
                          photo.user.profile_image.medium,
                        ),
                      ),
                      title: Text(photo.user.first_name),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Builder(builder: (context) {
                      return  LikeButton(
                        isLiked: photo.liked_by_user,
                        onTap: onLikeButtonTapped,
                        size: 24,
                        circleColor:
                        const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                        bubblesColor: const BubblesColor(
                          dotPrimaryColor: Color(0xff33b5e5),
                          dotSecondaryColor: Color(0xff0099cc),
                        ),
                        likeBuilder: (bool isLiked) => Icon(LineIcons.heartAlt, color: isLiked ? Colors.red : Colors.grey, size: 24,),
                        likeCount: photo.likes,
                        countBuilder: (int? count, bool isLiked, String text) {
                          var color = isLiked ? Colors.red : Colors.grey;
                          Widget result;
                          if (count == 0) {
                            result = Text(
                              "love",
                              style: TextStyle(color: color),
                            );
                          } else {
                            result = Text(
                              text,
                              style: TextStyle(color: color),
                            );
                          }
                          return result;
                        },
                      );
                    },),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    if(isLiked){
      Provider.of<PhotoController>(context,listen: false).unSetFavorite(photo);
    }else{
      Provider.of<PhotoController>(context,listen: false).setFavorite(photo);
    }
    photo.liked_by_user = !isLiked;
    return !isLiked;
  }
}
