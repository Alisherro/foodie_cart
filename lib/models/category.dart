class Categories {
  List<Category>? listCategories;

  Categories({this.listCategories});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['сategories'] != null) {
      listCategories = <Category>[];
      json['сategories'].forEach((v) {
        listCategories!.add(new Category.fromJson(v));
      });
    }
  }


}

class Category {
  int? id;
  String? name;
  String? imageUrl;

  Category({this.id, this.name, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
  }


}
