import 'package:anag_shop/provider/cart.dart';
import 'package:anag_shop/provider/orders.dart';
import 'package:anag_shop/screens/cart_screen.dart';
import 'package:anag_shop/screens/edit_product_screen.dart';
import 'package:anag_shop/screens/product_detail_screen.dart';
import 'package:anag_shop/screens/product_overview_screen.dart';
import 'package:anag_shop/screens/user_product_screen.dart';
import 'package:flutter/material.dart';
import './provider/products.dart';
import 'package:provider/provider.dart';
import './screens/orders_screen.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(
      create:(ctx) => Products(),
      ),
      ChangeNotifierProvider(
      create: (ctx) => Cart(),
      ),
       ChangeNotifierProvider(
      create: (ctx) => Orders(),
      ),
    ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme:ColorScheme.fromSwatch().copyWith(
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (context)=> ProductDetailsScreen(),
          CartScreen.routeName :(context) => CartScreen(),
          OrdersScreen.routeName :(context) => OrdersScreen(),
          UserProductScreen.routeName :(context) => UserProductScreen(),
          EditProductScreen.routeName :(context) => EditProductScreen(),

        },
      ),
    );
  }
}
