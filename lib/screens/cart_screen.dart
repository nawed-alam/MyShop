import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/orders.dart';
import '../provider/cart.dart' show Cart ;
import '../widgets/cart_item.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Orderbutton(cart: cart)
                ],
              ),
            ), 
          ),
          SizedBox(height: 10,),
          Expanded(child: ListView.builder(itemCount: cart.items.length,itemBuilder: (ctx,i) => CartItem(
            cart.items.values.toList()[i].id,
            cart.items.keys.toList()[i],
            cart.items.values.toList()[i].price,
            cart.items.values.toList()[i].quantity,
            cart.items.values.toList()[i].title)))
        ],
      ),
    );
  }
}

class Orderbutton extends StatefulWidget {
  
   Orderbutton({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  State<Orderbutton> createState() => _OrderbuttonState();
}

class _OrderbuttonState extends State<Orderbutton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child:_isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading) ? null : () async{
        setState(() {
          _isLoading = true;
        });
       await Provider.of<Orders>(context,listen: false).addOrder(widget.cart.items.values.toList() , widget.cart.totalAmount);
        widget.cart.clear();
        setState(() {
        _isLoading= false;
      });
      },
      
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all<Color>(Colors.purple),
      ),
    );
  }
}
