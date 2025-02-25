class HomeModel {
   String ?image;
   String ?title;
   double ?price;
   bool isFav ;

  HomeModel(  {this.isFav=false,  this.image,  this.title, this.price});

  factory HomeModel.fromJson( Map<String, dynamic> json) {
    return HomeModel(image: json['image'], title: json['title'], price: (json['price'] as num).toDouble(),);
  }
}
