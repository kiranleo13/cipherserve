import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (ctx, index) {
          final cartItem = cartProvider.cartItems[index];

          return ListTile(
            leading: Image.network(cartItem.product.imageUrl),
            title: Text(cartItem.product.name),
            subtitle: Text('Quantity: ${cartItem.quantity}'),
            trailing: Text('\$${cartItem.product.price * cartItem.quantity}'),
            onTap: () {
              // Implement any action when the item is tapped
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}'),
            ElevatedButton(
              child: Text('Checkout'),
              onPressed: () {
                // Implement the checkout logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
