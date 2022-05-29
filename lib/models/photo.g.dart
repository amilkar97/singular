// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoAdapter extends TypeAdapter<Photo> {
  @override
  final int typeId = 0;

  @override
  Photo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photo(
      fields[0] as String,
      fields[1] as DateTime,
      fields[2] as DateTime,
      fields[3] as DateTime?,
      fields[4] as int,
      fields[5] as int,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as Urls,
      fields[11] as PhotoLinks?,
      fields[12] as int,
      fields[14] as Sponsorship?,
      fields[15] as TopicSubmissions?,
      fields[16] as User,
      liked_by_user: fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Photo obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.created_at)
      ..writeByte(2)
      ..write(obj.updated_at)
      ..writeByte(3)
      ..write(obj.promoted_at)
      ..writeByte(4)
      ..write(obj.width)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.blur_hash)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.alt_description)
      ..writeByte(10)
      ..write(obj.urls)
      ..writeByte(11)
      ..write(obj.links)
      ..writeByte(12)
      ..write(obj.likes)
      ..writeByte(13)
      ..write(obj.liked_by_user)
      ..writeByte(14)
      ..write(obj.sponsorship)
      ..writeByte(15)
      ..write(obj.topic_submissions)
      ..writeByte(16)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhotoLinksAdapter extends TypeAdapter<PhotoLinks> {
  @override
  final int typeId = 1;

  @override
  PhotoLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoLinks(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PhotoLinks obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.self)
      ..writeByte(1)
      ..write(obj.html)
      ..writeByte(2)
      ..write(obj.download)
      ..writeByte(3)
      ..write(obj.download_location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SponsorshipAdapter extends TypeAdapter<Sponsorship> {
  @override
  final int typeId = 2;

  @override
  Sponsorship read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sponsorship(
      (fields[0] as List?)?.cast<String?>(),
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as User,
    );
  }

  @override
  void write(BinaryWriter writer, Sponsorship obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.impression_urls)
      ..writeByte(1)
      ..write(obj.tagline)
      ..writeByte(2)
      ..write(obj.taglineUrl)
      ..writeByte(3)
      ..write(obj.sponsor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SponsorshipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 3;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      fields[0] as String,
      fields[1] as DateTime,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as UserLinks?,
      fields[11] as ProfileImage,
      fields[12] as String?,
      fields[13] as int,
      fields[14] as int,
      fields[15] as int,
      fields[16] as bool?,
      fields[17] as bool,
      fields[18] as Social?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.updated_at)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.first_name)
      ..writeByte(5)
      ..write(obj.last_name)
      ..writeByte(6)
      ..write(obj.twitter_username)
      ..writeByte(7)
      ..write(obj.portfolio_url)
      ..writeByte(8)
      ..write(obj.bio)
      ..writeByte(9)
      ..write(obj.location)
      ..writeByte(10)
      ..write(obj.links)
      ..writeByte(11)
      ..write(obj.profile_image)
      ..writeByte(12)
      ..write(obj.instagram_username)
      ..writeByte(13)
      ..write(obj.total_collections)
      ..writeByte(14)
      ..write(obj.total_likes)
      ..writeByte(15)
      ..write(obj.total_photos)
      ..writeByte(16)
      ..write(obj.accepted_tos)
      ..writeByte(17)
      ..write(obj.for_hire)
      ..writeByte(18)
      ..write(obj.social);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserLinksAdapter extends TypeAdapter<UserLinks> {
  @override
  final int typeId = 4;

  @override
  UserLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLinks(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserLinks obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.self)
      ..writeByte(1)
      ..write(obj.html)
      ..writeByte(2)
      ..write(obj.photos)
      ..writeByte(3)
      ..write(obj.likes)
      ..writeByte(4)
      ..write(obj.portfolio)
      ..writeByte(5)
      ..write(obj.following)
      ..writeByte(6)
      ..write(obj.followers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProfileImageAdapter extends TypeAdapter<ProfileImage> {
  @override
  final int typeId = 5;

  @override
  ProfileImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileImage(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileImage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.small)
      ..writeByte(1)
      ..write(obj.medium)
      ..writeByte(2)
      ..write(obj.large);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SocialAdapter extends TypeAdapter<Social> {
  @override
  final int typeId = 6;

  @override
  Social read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Social(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Social obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.instagram_username)
      ..writeByte(1)
      ..write(obj.portfolio_url)
      ..writeByte(2)
      ..write(obj.twitter_username)
      ..writeByte(3)
      ..write(obj.paypal_email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TopicSubmissionsAdapter extends TypeAdapter<TopicSubmissions> {
  @override
  final int typeId = 7;

  @override
  TopicSubmissions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TopicSubmissions(
      fields[0] as Animals?,
      fields[1] as DigitalNomad?,
    );
  }

  @override
  void write(BinaryWriter writer, TopicSubmissions obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.animals)
      ..writeByte(1)
      ..write(obj.digital_nomad);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopicSubmissionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnimalsAdapter extends TypeAdapter<Animals> {
  @override
  final int typeId = 8;

  @override
  Animals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Animals(
      fields[0] as String?,
      fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Animals obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.approved_on);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DigitalNomadAdapter extends TypeAdapter<DigitalNomad> {
  @override
  final int typeId = 9;

  @override
  DigitalNomad read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DigitalNomad(
      fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DigitalNomad obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DigitalNomadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UrlsAdapter extends TypeAdapter<Urls> {
  @override
  final int typeId = 10;

  @override
  Urls read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Urls(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Urls obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.raw)
      ..writeByte(1)
      ..write(obj.full)
      ..writeByte(2)
      ..write(obj.regular)
      ..writeByte(3)
      ..write(obj.small)
      ..writeByte(4)
      ..write(obj.thumb)
      ..writeByte(5)
      ..write(obj.small_s3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UrlsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      json['id'] as String,
      DateTime.parse(json['created_at'] as String),
      DateTime.parse(json['updated_at'] as String),
      json['promoted_at'] == null
          ? null
          : DateTime.parse(json['promoted_at'] as String),
      json['width'] as int,
      json['height'] as int,
      json['color'] as String,
      json['blur_hash'] as String,
      json['description'] as String?,
      json['alt_description'] as String?,
      Urls.fromJson(json['urls'] as Map<String, dynamic>),
      json['links'] == null
          ? null
          : PhotoLinks.fromJson(json['links'] as Map<String, dynamic>),
      json['likes'] as int,
      json['sponsorship'] == null
          ? null
          : Sponsorship.fromJson(json['sponsorship'] as Map<String, dynamic>),
      json['topic_submissions'] == null
          ? null
          : TopicSubmissions.fromJson(
              json['topic_submissions'] as Map<String, dynamic>),
      User.fromJson(json['user'] as Map<String, dynamic>),
      liked_by_user: json['liked_by_user'] as bool? ?? false,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
      'promoted_at': instance.promoted_at?.toIso8601String(),
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'blur_hash': instance.blur_hash,
      'description': instance.description,
      'alt_description': instance.alt_description,
      'urls': instance.urls,
      'links': instance.links,
      'likes': instance.likes,
      'liked_by_user': instance.liked_by_user,
      'sponsorship': instance.sponsorship,
      'topic_submissions': instance.topic_submissions,
      'user': instance.user,
    };

PhotoLinks _$PhotoLinksFromJson(Map<String, dynamic> json) => PhotoLinks(
      json['self'] as String?,
      json['html'] as String?,
      json['download'] as String?,
      json['download_location'] as String?,
    );

Map<String, dynamic> _$PhotoLinksToJson(PhotoLinks instance) =>
    <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'download': instance.download,
      'download_location': instance.download_location,
    };

Sponsorship _$SponsorshipFromJson(Map<String, dynamic> json) => Sponsorship(
      (json['impression_urls'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['tagline'] as String?,
      json['taglineUrl'] as String?,
      User.fromJson(json['sponsor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SponsorshipToJson(Sponsorship instance) =>
    <String, dynamic>{
      'impression_urls': instance.impression_urls,
      'tagline': instance.tagline,
      'taglineUrl': instance.taglineUrl,
      'sponsor': instance.sponsor,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String,
      DateTime.parse(json['updated_at'] as String),
      json['username'] as String,
      json['name'] as String,
      json['first_name'] as String,
      json['last_name'] as String?,
      json['twitter_username'] as String?,
      json['portfolio_url'] as String?,
      json['bio'] as String?,
      json['location'] as String?,
      json['links'] == null
          ? null
          : UserLinks.fromJson(json['links'] as Map<String, dynamic>),
      ProfileImage.fromJson(json['profile_image'] as Map<String, dynamic>),
      json['instagram_username'] as String?,
      json['total_collections'] as int,
      json['total_likes'] as int,
      json['total_photos'] as int,
      json['accepted_tos'] as bool?,
      json['for_hire'] as bool,
      json['social'] == null
          ? null
          : Social.fromJson(json['social'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updated_at.toIso8601String(),
      'username': instance.username,
      'name': instance.name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'twitter_username': instance.twitter_username,
      'portfolio_url': instance.portfolio_url,
      'bio': instance.bio,
      'location': instance.location,
      'links': instance.links,
      'profile_image': instance.profile_image,
      'instagram_username': instance.instagram_username,
      'total_collections': instance.total_collections,
      'total_likes': instance.total_likes,
      'total_photos': instance.total_photos,
      'accepted_tos': instance.accepted_tos,
      'for_hire': instance.for_hire,
      'social': instance.social,
    };

UserLinks _$UserLinksFromJson(Map<String, dynamic> json) => UserLinks(
      json['self'] as String?,
      json['html'] as String?,
      json['photos'] as String?,
      json['likes'] as String?,
      json['portfolio'] as String?,
      json['following'] as String?,
      json['followers'] as String?,
    );

Map<String, dynamic> _$UserLinksToJson(UserLinks instance) => <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'photos': instance.photos,
      'likes': instance.likes,
      'portfolio': instance.portfolio,
      'following': instance.following,
      'followers': instance.followers,
    };

ProfileImage _$ProfileImageFromJson(Map<String, dynamic> json) => ProfileImage(
      json['small'] as String,
      json['medium'] as String,
      json['large'] as String,
    );

Map<String, dynamic> _$ProfileImageToJson(ProfileImage instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

Social _$SocialFromJson(Map<String, dynamic> json) => Social(
      json['instagram_username'] as String?,
      json['portfolio_url'] as String?,
      json['twitter_username'] as String?,
      json['paypal_email'],
    );

Map<String, dynamic> _$SocialToJson(Social instance) => <String, dynamic>{
      'instagram_username': instance.instagram_username,
      'portfolio_url': instance.portfolio_url,
      'twitter_username': instance.twitter_username,
      'paypal_email': instance.paypal_email,
    };

TopicSubmissions _$TopicSubmissionsFromJson(Map<String, dynamic> json) =>
    TopicSubmissions(
      json['animals'] == null
          ? null
          : Animals.fromJson(json['animals'] as Map<String, dynamic>),
      json['digital_nomad'] == null
          ? null
          : DigitalNomad.fromJson(
              json['digital_nomad'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopicSubmissionsToJson(TopicSubmissions instance) =>
    <String, dynamic>{
      'animals': instance.animals,
      'digital_nomad': instance.digital_nomad,
    };

Animals _$AnimalsFromJson(Map<String, dynamic> json) => Animals(
      json['status'] as String?,
      json['approved_on'] == null
          ? null
          : DateTime.parse(json['approved_on'] as String),
    );

Map<String, dynamic> _$AnimalsToJson(Animals instance) => <String, dynamic>{
      'status': instance.status,
      'approved_on': instance.approved_on?.toIso8601String(),
    };

DigitalNomad _$DigitalNomadFromJson(Map<String, dynamic> json) => DigitalNomad(
      json['status'] as String?,
    );

Map<String, dynamic> _$DigitalNomadToJson(DigitalNomad instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      json['raw'] as String,
      json['full'] as String,
      json['regular'] as String,
      json['small'] as String,
      json['thumb'] as String,
      json['small_s3'] as String,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
      'small_s3': instance.small_s3,
    };
