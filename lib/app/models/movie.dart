// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';

class Movie {

final int id;
final String tittle;
final String imageUrl;
final String realseDate;
final String Date;

  Movie({
    required this.id,
    required this.tittle,
    required this.imageUrl,
    required this.realseDate,
    required this.Date,
  });

String getPosterImage(){

return imageUrlPrefix + imageUrl;

}

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tittle': tittle,
      'imageUrl': imageUrl,
      'realseDate': realseDate,
      'Date': Date,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      tittle: map['tittle'] as String,
      imageUrl: map['poster_path'] as String,
      realseDate: map['release_date'] as String,
      Date: map['Date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
