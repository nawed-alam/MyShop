import 'package:flutter/material.dart';
class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id,this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(child: Image.network(imageUrl,fit: BoxFit.cover,),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading:IconButton(icon: Icon(Icons.favorite),
         color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          
        },) ,
        title: Text(title,textAlign: TextAlign.center,),
        trailing: IconButton(onPressed: (){
    
        }, icon: Icon(Icons.shopping_cart),
        color: Theme.of(context).colorScheme.secondary,),
        ),),
    );
  }
}