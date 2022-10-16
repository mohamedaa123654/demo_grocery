class AddressesModel {
  String? title;
  String? subTitle;

  AddressesModel({this.title, this.subTitle});

  AddressesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
  }

  
}
