import 'package:anag_shop/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';
class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl; 

  // ProductItem(this.id,this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {
   final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,arguments: product.id,);
        },
        child: Image.network(product.imageUrl,fit: BoxFit.cover,)),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading:IconButton(icon: Icon(product.isFavorite ?  Icons.favorite : Icons.favorite_border),
         color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          product.toggleFavoriteStatus();
        },) ,
        title: Text(product.title,textAlign: TextAlign.center,),
        trailing: IconButton(onPressed: (){
    
        }, icon: Icon(Icons.shopping_cart),
        color: Theme.of(context).colorScheme.secondary,),
        ),),
    );
  }
}