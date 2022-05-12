
class ProductModel {
   String? name, image, description, time, price, productId, category,kcal,quantity;
   // bool fav =false;

  ProductModel({
    required this.name,
    required this.image,
    required this.time,
    // required this.fav,
    required this.description,
    required this.price,
    required this.kcal,
    required this.productId,
    required this.category,
    required this.quantity,


  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    time = map['time'];
    price = map['price'];
    productId = map['productId'];
    category = map['category'];
    kcal = map['kcal'];
    quantity = map['quantity'];
    // fav = map['fav'];

  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'time': time,
      'price': price,
      'productId': productId,
      'category': category,
      'kcal': kcal,
      'quantity': quantity,
      // 'fav': fav,

    };
  }
}