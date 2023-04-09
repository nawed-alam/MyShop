import 'package:anag_shop/screens/product_detail_screen.dart';
import 'package:anag_shop/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import './provider/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
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

        },
      ),
    );
  }
}
