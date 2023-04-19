import 'package:anag_shop/screens/user_product_screen.dart';
import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
           title: Text('Shop'),
           onTap: (){
            Navigator.of(context).pushReplacementNamed('/');
           },
          ),
           ListTile(
            leading: Icon(Icons.payment),
           title: Text('orders'),
           onTap: (){
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
           },
          ),
          ListTile(
            leading: Icon(Icons.edit),
           title: Text('Manage Product'),
           onTap: (){
            Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
           },
          ),
        ],
      ),
    );
  }
}