class HomeModel {
  final String image;
  final String title;
  final double price;
   bool isFav ;

  HomeModel(  {this.isFav=false, required this.image, required this.title,required this.price});

  factory HomeModel.fromJson( Map<String, dynamic> json) {
    return HomeModel(image: json['image'], title: json['title'], price: (json['price'] as num).toDouble(),);
  }
}
