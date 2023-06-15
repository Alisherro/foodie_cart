import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie_cart/icons/svg_icons.dart';
import 'package:foodie_cart/screens/cart_screen/cart_screen_provider.dart';
import 'package:foodie_cart/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_bar_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartScreenProvider>();
    return Scaffold(
      appBar: AppBar(title: AppBarWidget()),
      body: provider.cartList.isEmpty
          ? Center(
              child: Text('Корзина пуста ;('),
            )
          : Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ...provider.cartList.entries
                            .map(
                              (entry) => CartItemWidget(
                                dishes: entry.key,
                                counter: entry.value,
                              ),
                            )
                            .toList(),
                        SizedBox(
                          height: 62,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    child: GestureDetector(
                      onTap: () => provider.clearState(),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 32,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xff3364E0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Оплатить ${provider.sum} ₽',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
