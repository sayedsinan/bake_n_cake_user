class ProductModel {
  final String documentID;
  final String name;
  final int id;
  final double price;
  final String description;
  String image;

  ProductModel({
    required this.documentID,
    required this.name,
    required this.id,
    required this.price,
    required this.description,
    required this.image,
  });
 factory ProductModel.fromJson(Map<String, dynamic> json, String documentID) {
  return ProductModel(
    documentID: documentID,
    name: json['name'] ?? '',
    id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
    price: (json['price'] is double) ? json['price'] : (json['price'] is int) ? json['price'].toDouble() : 0.0,
    description: json['description'] ?? '',
    image: json['image'] ?? '',
  );
}


}