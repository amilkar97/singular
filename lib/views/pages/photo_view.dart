

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:singular/models/photo.dart';
import 'package:singular/views/pages/user_view.dart';

class PhotoView extends StatelessWidget {
  final Photo photo;
  const PhotoView({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            forceElevated: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        photo.urls.full,
                        cacheKey: photo.id
                    )
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${photo.likes} likes',style:const TextStyle(color: Colors.white,fontSize: 17),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Creado el ${photo.created_at.toString()}'),
                  const SizedBox(height: 10,),
                  const Text('Description',style: TextStyle(fontSize: 20)),
                  Text(photo.description ?? '',),
                  const SizedBox(height: 10,),
                  if(photo.sponsorship != null)...[
                    const Text('Sponsorship',style: TextStyle(fontSize: 20)),
                    Text(photo.sponsorship!.tagline.toString()),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserView(user: photo.sponsorship!.sponsor),)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: CachedNetworkImageProvider(
                              photo.sponsorship!.sponsor.profile_image.medium
                          ),
                        ),
                        title: Text(photo.sponsorship!.sponsor.first_name),
                        subtitle: Text(photo.sponsorship!.sponsor.username),
                      ),
                    )
                  ],
                  const Text('User',style: TextStyle(fontSize: 20)),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserView(user: photo.user),)),
                    child: ListTile(
                      leading: Hero(
                        tag: photo.user.id,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: CachedNetworkImageProvider(
                              photo.user.profile_image.medium
                          ),
                        ),
                      ),
                      title: Text(photo.user.first_name),
                      subtitle: Text(photo.user.username),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
