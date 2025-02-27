class DetailProductModel {
  String ?title;
  String ?price;
  String ?image;

  DetailProductModel(
      {  this.image,   this.title,   this.price});

  factory DetailProductModel.formJson(Map<String, dynamic> json) {
    return DetailProductModel(
        image: json['image'], title: json['title'], price: json['price'].toString());
  }
}
////////////////////////////////////////////////////////////////
class ViewProduct {
  String ?image;
  String ?title;
  double ?price;


  ViewProduct(  { this.image,  this.title, this.price });

  factory ViewProduct.fromJson( Map<String, dynamic> json) {
    return ViewProduct(image: json['image'], title: json['title'], price: (json['price'] as num).toDouble());
  }
}
