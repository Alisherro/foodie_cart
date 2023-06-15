class DishesList {
  List<Dishes>? dishes;

  DishesList({this.dishes});

  DishesList.fromJson(Map<String, dynamic> json) {
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(new Dishes.fromJson(v));
      });
    }
  }


}

class Dishes {
  int? id;
  String? name;
  int? price;
  int? weight;
  String? description;
  String? imageUrl;
  List<String>? tags;

  Dishes(
      {this.id,
        this.name,
        this.price,
        this.weight,
        this.description,
        this.imageUrl,
        this.tags});

  Dishes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    weight = json['weight'];
    description = json['description'];
    imageUrl = json['image_url'];
    tags = json['tegs'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['weight'] = this.weight;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['tegs'] = this.tags;
    return data;
  }
}
