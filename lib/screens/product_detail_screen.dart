import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';

class ProductDetailsScreen extends StatelessWidget {

  //final String title;
  // ProductDetailsScreen(this.title);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
    ModalRoute.of(context)?.settings.arguments as String;
    final loadedproduct =Provider.of<Products>(context,listen: false,).findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedproduct.title),),
      body: Center(child: Text("details!"),),
    );
  }
}