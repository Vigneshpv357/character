import 'package:character/app/services/webservicess.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../shared/state/datastate.dart';
import '../model/product_model.dart';

class ProductListController with ChangeNotifier{
  DataState _state = DataState.initial;
  DataState get state => _state;
  void _setState(DataState state){
    _state = state;
  }
  Failure _failure=Failure(message: 'message');
  Failure get failure => _failure;
  void _setFailure(Failure failure){
    _failure= failure;
  }
  List<Product> _products =[];
  List<Product> get product => _products;
  Future<void> getProducts() async{
    try{
      _setState(DataState.loading);
      _products = await WebServices.getProducts();
      _setState(DataState.loading);
    } on Failure catch (f){
      _setFailure(f);
      _setState(DataState.notLoaded);
    }
    notifyListeners();
  }

}