import 'package:flutter/material.dart';
import 'package:foodie_cart/models/dishes.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen/cart_screen_provider.dart';

class DishWidget extends StatelessWidget {
  const DishWidget({Key? key, required this.dishes}) : super(key: key);

  final Dishes dishes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.symmetric(horizontal: 16),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xffF8F7F5),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(dishes.imageUrl!),
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.favorite_border_outlined),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: ()=>Navigator.of(context).pop(),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(12),
                                child: Icon(Icons.close),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    dishes.name!,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('${dishes.price} ₽'),
                      Text(
                        ' · ${dishes.weight}г',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    dishes.description!,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      context.read<CartScreenProvider>().addItem(dishes);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff3364E0),
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            'Добавить в корзину',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 109,
            decoration: BoxDecoration(
              color: Color(0xffF8F7F5),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(dishes.imageUrl!),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Text(
            dishes.name!,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
