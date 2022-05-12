
class FavModel {
  String? name, image, time,  productId;

  FavModel({
   this.name,
     this.image,
     this.time,
     this.productId,


  });

  FavModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    time = map['time'];
    productId = map['productId'];

  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'time': time,
      'productId': productId,

    };
  }
}