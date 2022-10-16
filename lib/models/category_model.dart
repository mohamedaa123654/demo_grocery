
class CategoryModel {
  String? title;
  String? color;

  CategoryModel({this.title, this.color});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    color = json['color'];
  }

  
}
