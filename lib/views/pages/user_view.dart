

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:singular/models/photo.dart';

class UserView extends StatelessWidget {
  final User user;
  const UserView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: false,
            pinned: true,
            floating: false,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(user.first_name),
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
              background: Hero(
                tag: user.id,
                child: CachedNetworkImage(
                  imageUrl: user.profile_image.medium,
                  fit: BoxFit.cover,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Icon(LineIcons.heart),
                            Text(user.total_likes.toString())
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(LineIcons.image),
                            Text(user.total_photos.toString())
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(LineIcons.photoVideo),
                            Text(user.total_collections.toString())
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: user.for_hire ? Colors.green.shade100 : Colors.red.shade200
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            user.for_hire
                                ? 'For hire'
                                : 'Hired'
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Bio',style: TextStyle(fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(user.bio ?? '',textAlign: TextAlign.left,),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: Text(user.location ?? 'Sin ubicacion'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Social',style: TextStyle(fontSize: 20)),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          leading: const Icon(LineIcons.instagram),
                          title: Text(user.social?.instagram_username != null
                          ? '@${user.social?.instagram_username}'
                          : 'None'),
                        ),
                      ),
                      Flexible(
                          child: ListTile(
                            leading: const Icon(LineIcons.twitter),
                            title: Text(user.social?.twitter_username != null
                              ? '@${user.social?.twitter_username}'
                                : 'None'
                            ),
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          leading: const Icon(LineIcons.portrait),
                          title: Text(user.social?.portfolio_url ?? 'None')
                        ),
                      ),
                      Flexible(
                          child: ListTile(
                            leading: const Icon(LineIcons.paypal),
                            title: Text(user.social?.paypal_email ?? 'None'),
                          )
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
