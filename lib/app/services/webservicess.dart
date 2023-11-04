import 'dart:convert';

import 'dart:io';

import 'package:character/app/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../model/cart.dart';
class WebServices{
  static Future getProducts() async{
    Uri url = Uri.parse('https://dummyjson.com/products');
    try{
      var response = await http.get(url);
      List data =json.decode(response.body)['products'];
      return data.map((e) => Product.fromJson(e)).toList();
    }on SocketException catch(_){
      throw Failure(
          message: 'There is no internet connection.\n Please check your data roaming'
      );
    } on HttpException catch (e){
      throw Failure(message: 'Oopss!!!\n$e.message');
    }
  }
  // static Future getCart(int userId) async {
  //   Uri url = Uri.parse('https://dummyjson.com/carts/user/$userId');
  //   var response = await http.get(url);
  //   try {
  //     Cart data = Cart.fromJson(json.decode(response.body)['carts']);
  //     return data;
  //   } on SocketException catch (e) {
  //     throw Failure(
  //         message:
  //         'There is no internet connection.\n Please check your data roaming.\n${e.toString()}');
  //   } on HttpException catch (e) {
  //     throw Failure(message: '${response.statusCode}\n${e.toString()}');
  //   }
  // }
}


class Failure implements Exception {
  String message;

  Failure({required this.message});

  @override
  String toString() {
    return message;
  }
}