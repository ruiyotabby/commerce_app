class Products {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  const Products({
     this.id,
     this.title,
     this.description,
     this.category,
     this.rating,
     this.image,
     this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'],
      price: json['price'].toDouble(),
    );
  }
}

class Rating {
  final double? rate;
  final int? count;

  const Rating({
     this.rate,
     this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'].toInt(),
    );
  }
}
