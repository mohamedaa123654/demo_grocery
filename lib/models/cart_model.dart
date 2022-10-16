class CartModel {
  int? id;
  String? name;
  String? weight;
  int? price;
  String? color;

  CartModel({this.id, this.name, this.weight, this.price, this.color});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    weight = json['weight'];
    price = json['price'];
    color = json['color'];
  }

  
}
