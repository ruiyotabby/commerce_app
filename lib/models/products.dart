// import 'dart:convert';

// List<Products> productsFromJson(String str) =>
//     List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

// String productsToJson(List<Products> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Products({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.rating,
    required this.image,
    required this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: Rating.fromJson(json['rating']),
      price: json['price'] as num,
    );
  }
}

class Rating {
  final num rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'] as num,
      count: json['count'] as int,
    );
  }
}
