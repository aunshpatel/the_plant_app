class Plant {
  final String id;
  final String categoryID;
  final String imageUrl;
  final String name;
  final String rating;
  final String displaySize;
  final List availableSize;
  final String unit;
  final String price;
  final String priceUnit;
  final String description;

  // Plant({required this.id, required this.name, required this.type, required this.imageUrl, required this.description});
  Plant({required this.id, required this.categoryID, required this.imageUrl, required this.name, required this.rating, required this.displaySize, required this.availableSize, required this.unit, required this.price, required this.priceUnit, required this.description});

  factory Plant.fromJson(Map<String, dynamic> json) {
    // print("json:$json");
    return Plant(
      id: json['id'].toString(),
      categoryID: json['category_id'].toString(),
      imageUrl: json['image_url'].toString(),
      name: json['name'].toString(),
      rating: json['rating'].toString(),
      displaySize: json['display_size'].toString(),
      availableSize: json['available_size'],
      unit: json['unit'].toString(),
      price: json['price'].toString(),
      priceUnit: json['price_unit'].toString(),
      description: json['description'].toString(),
    );
  }
}
