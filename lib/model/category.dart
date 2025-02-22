class Category {
  final String id;
  final String name;

  //* Category class Constructor
  Category({required this.id, required this.name});

//* Get info as JsonData
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
  //* send to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
