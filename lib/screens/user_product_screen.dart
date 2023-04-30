import 'package:anag_shop/provider/product.dart';
import 'package:anag_shop/screens/edit_product_screen.dart';
import 'package:anag_shop/widgets/app_drawer.dart';
import 'package:anag_shop/widgets/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-product';

  Future<void> _refreshproducts(BuildContext context) async{
 await Provider.of<Products>(context,listen: false).fetchingAndSetProducts();
  }
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your products'), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: const Icon(Icons.add))
      ]),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh:()=> _refreshproducts(context),
        child: Padding(
          padding: EdgeInsets.all(18),
          child: ListView.builder(
              itemCount: productsData.items.length,
              itemBuilder: (_, i) => Column(
                    children: [
                      UserProductitem(
                        productsData.items[i].id!,
                        productsData.items[i].title,
                          productsData.items[i].imageUrl),
                      Divider(),
                    ],
                  )),
        ),
      ),
    );
  }
}
