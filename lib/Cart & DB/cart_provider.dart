import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:salman/Cart%20&%20DB/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CartModel.dart';

class CartProvider  with ChangeNotifier{

  DBHelper db = DBHelper();
  int _counter =0;
  int get counter => _counter;



  int _totalPrice =0;
  int get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;


  Future<List<Cart>> getData () async{
    _cart= db.getCartList();
    return _cart;
  }


  void _setPrefItems()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setInt('total_price', _totalPrice);
    notifyListeners();

  }
  void _getPrefItems()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item')?? 0;
    _totalPrice = prefs.getInt('total_price') ??0;
    notifyListeners();

  }

  void addcounter (){
    _counter++;
    _setPrefItems();
    notifyListeners();
  }
  void subcounter (){
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getcounter (){
    _getPrefItems();
    return _counter;

  }

  void addTotalPrice (int productPrices){
    _totalPrice =_totalPrice+productPrices;
    _setPrefItems();
    notifyListeners();
  }

  void subTotalPrice (int productPrices){
    _totalPrice =_totalPrice-productPrices;
    _setPrefItems();
    notifyListeners();
  }

  int getTotalPrice (){
    _getPrefItems();
    return _totalPrice;

  }

}