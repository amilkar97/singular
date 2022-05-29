import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:singular/models/photo.dart';

part 'photo_service.g.dart';

@RestApi(baseUrl: "https://api.unsplash.com")
abstract class PhotoService {
  factory PhotoService(Dio dio, {String baseUrl}) = _PhotoService;

  @GET("/photos")
  Future<List<Photo>> getPhotos({
    @Query('page') int? page,
    @Query('per_page') int? perPage
  });

  @GET("/users/{username}/photos")
  Future<List<Photo>> searchPhotos(@Path('username') String username,
      {@Query('page') int? page,
      @Query('per_page') int? perPage
      });


  static PhotoService instance() {
    Dio dio = Dio();
    dio.options.headers = {
      'Accept-Version': 'v1',
      'Authorization': 'Client-ID ${dotenv.get('ACCESS_KEY')}'
    };

    return PhotoService(dio);
  }

}

