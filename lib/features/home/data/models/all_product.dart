import 'package:store_app/core/api/end_points.dart';

class AllProductModel {
  final dynamic id;
  final String title;
  final String image;
  final String description;
  final dynamic price;
  final RatingModel rating;

  AllProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
  });

  factory AllProductModel.fromJson(jsonData) {
    return AllProductModel(
      id: jsonData[ApiKeys.id],
      title: jsonData[ApiKeys.title],
      image: jsonData[ApiKeys.image],
      description: jsonData[ApiKeys.description],
      price: jsonData[ApiKeys.price],
      rating: RatingModel.fromJson(jsonData[ApiKeys.rating]),
    );
  }
}


class RatingModel {
  final dynamic rate;
  final dynamic count;

  RatingModel({
    required this.rate,
    required this.count,

  });

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}