
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';



@JsonSerializable()
@HiveType(typeId: 0)
class Photo extends HiveObject {

  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime created_at;

  @HiveField(2)
  DateTime updated_at;

  @HiveField(3)
  DateTime? promoted_at;

  @HiveField(4)
  int width;

  @HiveField(5)
  int height;

  @HiveField(6)
  String color;

  @HiveField(7)
  String blur_hash;

  @HiveField(8)
  String? description;

  @HiveField(9)
  String? alt_description;

  @HiveField(10)
  Urls urls;

  @HiveField(11)
  PhotoLinks? links;

  @HiveField(12)
  int likes;

  @HiveField(13)
  bool liked_by_user;

  @HiveField(14)
  Sponsorship? sponsorship;

  @HiveField(15)
  TopicSubmissions? topic_submissions;

  @HiveField(16)
  User user;

  Photo(
      this.id,
      this.created_at,
      this.updated_at,
      this.promoted_at,
      this.width,
      this.height,
      this.color,
      this.blur_hash,
      this.description,
      this.alt_description,
      this.urls,
      this.links,
      this.likes,
      this.sponsorship,
      this.topic_submissions,
      this.user,{this.liked_by_user = false});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

}
@JsonSerializable()
@HiveType(typeId: 1)
class PhotoLinks extends HiveObject{

  @HiveField(0)
  String? self;

  @HiveField(1)
  String? html;

  @HiveField(2)
  String? download;

  @HiveField(3)
  String? download_location;


  PhotoLinks(this.self, this.html, this.download, this.download_location);

  factory PhotoLinks.fromJson(Map<String, dynamic> json) => _$PhotoLinksFromJson(json);

}
@JsonSerializable()
@HiveType(typeId: 2)
class Sponsorship extends HiveObject{

  @HiveField(0)
  List<String?>? impression_urls;

  @HiveField(1)
  String? tagline;

  @HiveField(2)
  String? taglineUrl;

  @HiveField(3)
  User sponsor;

  Sponsorship(this.impression_urls, this.tagline, this.taglineUrl, this.sponsor);

  factory Sponsorship.fromJson(Map<String, dynamic> json) => _$SponsorshipFromJson(json);

}
@JsonSerializable()
@HiveType(typeId: 3)
class User extends HiveObject{

  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime updated_at;

  @HiveField(2)
  String username;

  @HiveField(3)
  String name;

  @HiveField(4)
  String first_name;

  @HiveField(5)
  String? last_name;

  @HiveField(6)
  String? twitter_username;

  @HiveField(7)
  String? portfolio_url;

  @HiveField(8)
  String? bio;

  @HiveField(9)
  String? location;

  @HiveField(10)
  UserLinks? links;

  @HiveField(11)
  ProfileImage profile_image;

  @HiveField(12)
  String? instagram_username;

  @HiveField(13)
  int total_collections;

  @HiveField(14)
  int total_likes;

  @HiveField(15)
  int total_photos;

  @HiveField(16)
  bool? accepted_tos;

  @HiveField(17)
  bool for_hire;

  @HiveField(18)
  Social? social;

  User(
      this.id,
      this.updated_at,
      this.username,
      this.name,
      this.first_name,
      this.last_name,
      this.twitter_username,
      this.portfolio_url,
      this.bio,
      this.location,
      this.links,
      this.profile_image,
      this.instagram_username,
      this.total_collections,
      this.total_likes,
      this.total_photos,
      this.accepted_tos,
      this.for_hire,
      this.social);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}
@JsonSerializable()
@HiveType(typeId: 4)
class UserLinks extends HiveObject{

  @HiveField(0)
  String? self;

  @HiveField(1)
  String? html;

  @HiveField(2)
  String? photos;

  @HiveField(3)
  String? likes;

  @HiveField(4)
  String? portfolio;

  @HiveField(5)
  String? following;

  @HiveField(6)
  String? followers;


  UserLinks(this.self, this.html, this.photos, this.likes, this.portfolio,
      this.following, this.followers);

  factory UserLinks.fromJson(Map<String, dynamic> json) => _$UserLinksFromJson(json);

}
@JsonSerializable()
@HiveType(typeId: 5)
class ProfileImage extends HiveObject{

  @HiveField(0)
  String small;

  @HiveField(1)
  String medium;

  @HiveField(2)
  String large;

  ProfileImage(this.small, this.medium, this.large);

  factory ProfileImage.fromJson(Map<String, dynamic> json) => _$ProfileImageFromJson(json);

}
@JsonSerializable()
@HiveType(typeId: 6)
class Social extends HiveObject{

  @HiveField(0)
  String? instagram_username;

  @HiveField(1)
  String? portfolio_url;

  @HiveField(2)
  String? twitter_username;

  @HiveField(3)
  dynamic paypal_email;


  Social(this.instagram_username, this.portfolio_url, this.twitter_username,
      this.paypal_email);

  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);

}
@JsonSerializable()
@HiveType(typeId: 7)
class TopicSubmissions extends HiveObject{

  @HiveField(0)
  Animals? animals;

  @HiveField(1)
  DigitalNomad? digital_nomad;

  TopicSubmissions(this.animals, this.digital_nomad);

  factory TopicSubmissions.fromJson(Map<String, dynamic> json) => _$TopicSubmissionsFromJson(json);

}
@JsonSerializable()
@HiveType(typeId: 8)
class Animals extends HiveObject{

  @HiveField(0)
  String? status;

  @HiveField(1)
  DateTime? approved_on;
  factory Animals.fromJson(Map<String, dynamic> json) => _$AnimalsFromJson(json);

  Animals(this.status, this.approved_on);

}
@JsonSerializable()
@HiveType(typeId: 9)
class DigitalNomad extends HiveObject{

  @HiveField(0)
  String? status;

  factory DigitalNomad.fromJson(Map<String, dynamic> json) => _$DigitalNomadFromJson(json);

  DigitalNomad(this.status);

}
@JsonSerializable()
@HiveType(typeId: 10)
class Urls extends HiveObject{

  @HiveField(0)
  String raw;

  @HiveField(1)
  String full;

  @HiveField(2)
  String regular;

  @HiveField(3)
  String small;

  @HiveField(4)
  String thumb;

  @HiveField(5)
  String small_s3;

  Urls(this.raw, this.full, this.regular, this.small, this.thumb, this.small_s3);


  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

}
