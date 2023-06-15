import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../screens/cart_screen/cart_screen_view.dart';
import '../screens/category_screen/category_screen_view.dart';
import '../screens/main_screen/main_screen_view.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({super.key});

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  late int _currentIndex;

  final _routerDelegates = [
    BeamerDelegate(
      initialPath: '/a',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/a')) {
          return ALocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/b',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/b')) {
          return BLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    _currentIndex = uriString.contains('/a') ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Beamer(
            routerDelegate: _routerDelegates[0],
          ),
          Container(),
          Beamer(
            routerDelegate: _routerDelegates[1],
          ),
          Container()
        ],
      ),
      // the usual BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Корзина'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Аккаунт'),
        ],
        onTap: (index) {
          if (index != _currentIndex) {
            setState(() => _currentIndex = index);
            // if(index==0){
            //   _routerDelegates[0].update(rebuild: false);
            // }else if(index==2){
            //   _routerDelegates[1].update(rebuild: false);
            // }
          }
        },
      ),
    );
  }
}

class ALocation extends BeamLocation<BeamState> {
  ALocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('a'),
          title: 'Tab A',
          type: BeamPageType.noTransition,
          child: MainScreen(),
        ),
        if (state.uri.pathSegments.length == 2)
           BeamPage(
            key: ValueKey('a/details'),
            title: 'Details A',
            child: CategoryScreen(categoryName: state.pathParameters["categoryName"]!,),
          ),
      ];
}

class BLocation extends BeamLocation<BeamState> {
  BLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('b'),
          title: 'Tab B',
          type: BeamPageType.noTransition,
          child: CartScreen(),
        ),
      ];
}
