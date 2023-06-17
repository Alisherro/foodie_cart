import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie_cart/icons/svg_icons.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              SvgIcons.svgHome(_calculateSelectedIndex(context) == 0),
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.string(
                SvgIcons.svgSearch(_calculateSelectedIndex(context) == 1),
              ),
              label: 'Поиск'),
          BottomNavigationBarItem(
              icon: SvgPicture.string(
                SvgIcons.svgCart(_calculateSelectedIndex(context) == 2),
              ),
              label: 'Корзина'),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              SvgIcons.svgProfile(_calculateSelectedIndex(context) == 3),
            ),
            label: 'Аккаунт',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/main')) {
      return 0;
    }
    if (location.startsWith('/search')) {
      return 1;
    }
    if (location.startsWith('/cart')) {
      return 2;
    }
    if (location.startsWith('/profile')) {
      return 3;
    }
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}
