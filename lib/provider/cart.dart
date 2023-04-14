import 'package:flutter/material.dart';

import '../models/cart_model.dart';


class Cart with ChangeNotifier {
   late Map<String,CartModel>_items = {};

   Map<String,CartModel> get items{
    return {..._items};
   }
 int get itemCount{
  return _items == null ? 0 : _items.length;
 }

double get totalAmount{
  var total =0.0;
  _items.forEach((key, cartitem) {
    total += cartitem.price * cartitem.quantity;
  });
return total;

}

   void addItem(String productId,double price,String title){
if(_items.containsKey(productId)){
_items.update(productId, (existingCartItem) => CartModel(
  id: existingCartItem.id, 
  title: existingCartItem.title,
   quantity: existingCartItem.quantity+1,
    price: existingCartItem.price,
    ));
}
else{
  _items.putIfAbsent(productId, () => CartModel(
    id: DateTime.now().toString(),
     title: title,
      quantity: 1,
       price: price,
       ));
}
notifyListeners();
   }
   void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
   }
   void clear(){
  _items={};
  notifyListeners();
  
}
}