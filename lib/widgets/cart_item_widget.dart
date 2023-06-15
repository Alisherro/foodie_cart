import 'package:flutter/material.dart';
import 'package:foodie_cart/models/dishes.dart';
import 'package:foodie_cart/screens/cart_screen/cart_screen_provider.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key, required this.dishes, required this.counter})
      : super(key: key);

  final Dishes dishes;
  final int counter;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CartScreenProvider>();
    return ListTile(
      trailing: Container(
        height: 32,
        decoration: BoxDecoration(
          color: Color(0xffEFEEEC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.remove, color: Colors.black, size: 10),
              onPressed: () => provider.removeItem(dishes),
            ),
            Text(counter.toString()),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.black, size: 10),
              onPressed: () => provider.addItem(dishes),
            ),
          ],
        ),
      ),
      title: Text('${dishes.name!}'),
      subtitle: Row(
        children: [
          Text('${dishes.price! * counter} ₽'),
          Text(
            ' · ${dishes.weight! * counter}г',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      leading: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(dishes.imageUrl!), fit: BoxFit.contain),
          color: Color(0xffF8F7F5),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
