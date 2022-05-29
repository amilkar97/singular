import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:singular/controllers/network_controller.dart';
import 'package:singular/controllers/photo_controller.dart';
import 'package:singular/models/photo.dart';
import 'package:singular/views/main_page.dart';
Future main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PhotoAdapter());
  Hive.registerAdapter(PhotoLinksAdapter());
  Hive.registerAdapter(SponsorshipAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserLinksAdapter());
  Hive.registerAdapter(ProfileImageAdapter());
  Hive.registerAdapter(SocialAdapter());
  Hive.registerAdapter(TopicSubmissionsAdapter());
  Hive.registerAdapter(AnimalsAdapter());
  Hive.registerAdapter(DigitalNomadAdapter());
  Hive.registerAdapter(UrlsAdapter());

  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NetworkController(),lazy: true),
        ChangeNotifierProvider(create: (context) => PhotoController(),lazy: true),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true
        ),
        home: const MainPage(),
      ),
    );
  }
}

