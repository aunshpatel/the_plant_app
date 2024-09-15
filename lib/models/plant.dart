class Plant {
  final String id;
  final String name;
  // final String type;
  final String imageUrl;
  final String description;

  // Plant({required this.id, required this.name, required this.type, required this.imageUrl, required this.description});
  Plant({required this.id, required this.name, required this.imageUrl, required this.description});

  factory Plant.fromJson(Map<String, dynamic> json) {
    // print("json:$json");
    return Plant(
      id: json['id'].toString(),
      name: json['name'].toString(),
      // type: json['type'].toString(),
      imageUrl: json['image_url'].toString(),
      description: json['description'].toString(),
    );
  }
}
