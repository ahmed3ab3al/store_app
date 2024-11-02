class AllProductModel {
  final int id;
  final String title;
  final String image;
  final String description;
  final double price;
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
      id: jsonData['id'],
      title: jsonData['title'],
      image: jsonData['image'],
      description: jsonData['description'],
      price: jsonData['price'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}


class RatingModel {
  final double rate;
  final int count;

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