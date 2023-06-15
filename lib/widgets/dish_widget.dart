import 'package:flutter/material.dart';
import 'package:foodie_cart/models/dishes.dart';

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
            return AlertDialog();
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
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
