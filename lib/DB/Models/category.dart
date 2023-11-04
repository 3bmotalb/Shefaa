class CategoryModel {
  String? nameen;
  String? namear;
  String? image;
  String? id;

  CategoryModel({
    this.nameen,
    this.namear,
    this.image,
    this.id,
  });

  CategoryModel.fromJson(Map<String, dynamic> json, String catid) {
    nameen = json['name_en'];
    namear = json['name_ar'];
    image = json['image'];
    id = catid;
  }
}
