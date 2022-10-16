class DealsModel {
  int? id;
  String? name;
  int? noPieces;
  int? time;
  int? newPrice;
  int? oldPrice;

  DealsModel(
      {this.id,
      this.name,
      this.noPieces,
      this.time,
      this.newPrice,
      this.oldPrice});

  DealsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    noPieces = json['noPieces'];
    time = json['time'];
    newPrice = json['newPrice'];
    oldPrice = json['oldPrice'];
  }

  
}
