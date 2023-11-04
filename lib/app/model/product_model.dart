class Product{
  int? quantity;
  num? total;
  num? discountPercentage;
  num? discountPrice;
  String? brand;
  String? category;
  String? descripition;
  num? rating;
  int id;
  String title;
  num price;
  String images;
  bool isFavorite=false;

  Product(
         {this.quantity,
         this.total,
           this.discountPercentage,
           this.discountPrice,
           this.brand,
           this.category,
           this.descripition,
           this.rating,
           required this.id,
           required this.title,
           required this.price,
           required this.images,
         }
      );
      factory Product.fromJson(Map<String, dynamic> json) => Product(
          quantity:json['quantity'],
          total: json['total'],
          discountPercentage:json['discountPercentage'],
          discountPrice:json['discountPrice'],
          id:json['id'],
          title:json['title'],
          brand:json['brand'],
          price:json['price'],
          category:json['category'],
          descripition:json['descripition'],
          rating:json['rating'],
          images:json['images']
      );
      Map<String,dynamic> toJson() =>{
        'quantity':quantity,
        'total': total,
        'discountPercentage':discountPercentage,
        'discountPrice':discountPrice,
        'id':id,
        'title':title,
        'brand':brand,
        'price':price,
        'category':category,
        'descripition':descripition,
        'rating':rating,
        'images':images
      };
  }

