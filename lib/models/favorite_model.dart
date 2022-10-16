class FavoritsModel {
  String? name;
  int? noPieces;
  int? time;
  int? newPrice;
  int? oldPrice;

  FavoritsModel(
      {this.name, this.noPieces, this.time, this.newPrice, this.oldPrice});

  FavoritsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    noPieces = json['noPieces'];
    time = json['time'];
    newPrice = json['newPrice'];
    oldPrice = json['oldPrice'];
  }
}
