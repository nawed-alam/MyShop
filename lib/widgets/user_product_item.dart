import 'package:anag_shop/screens/edit_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
class UserProductitem extends StatelessWidget {
  final String id;
 final String title;
 final String imageUrl;
 UserProductitem(this.id,this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {

    return ListTile(title: Text(title),leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)
    ,),
    trailing: Container(
      width: 100,
      child: Row(
        children: [
          IconButton( color: Theme.of(context).primaryColor,onPressed: (){
    Navigator.of(context).pushNamed(EditProductScreen.routeName,arguments: id);
          }, icon: Icon(Icons.edit)),
          IconButton(onPressed: (){
        Provider.of<Products>(context, listen: false).deleteProduct(id);
          }, icon: Icon(Icons.delete),color: Theme.of(context).colorScheme.error,),
        ],
      ),
    ),
    );
  }
}