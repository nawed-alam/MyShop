import 'package:anag_shop/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/orders.dart' show Orders;
import '../widgets/order_item.dart';


class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const routeName ='/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(itemCount: orderData.orders.length,itemBuilder: (ctx, i) => OrderItem(orderData.orders[i] ),),
    );
  }
}