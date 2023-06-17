import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_cart/screens/cart_screen/cart_screen_provider.dart';
import 'package:foodie_cart/screens/cart_screen/cart_screen_view.dart';
import 'package:foodie_cart/screens/category_screen/category_screen_provider.dart';
import 'package:foodie_cart/screens/category_screen/category_screen_view.dart';
import 'package:foodie_cart/screens/main_screen/main_screen_view.dart';
import 'package:foodie_cart/widgets/app_bar_widget.dart';
import 'package:foodie_cart/widgets/bottom_nav_bar_wrapper.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  initializeDateFormatting("ru_RU", null);
  runApp(MyApp());
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  final GoRouter _routera = GoRouter(

    navigatorKey:_rootNavigatorKey,
    initialLocation: '/main',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithBottomNavBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/main',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return CustomTransitionPage(
                    child: const MainScreen(),
                    transitionDuration: const Duration(milliseconds: 150),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return FadeTransition(
                        opacity:
                        CurveTween(curve: Curves.easeInOut).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                routes: [
                  GoRoute(
                    path: 'details/:id',
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return CustomTransitionPage(
                        child: CategoryScreen(
                            categoryName:
                            state.pathParameters["id"] ?? 'Title Default'),
                        transitionDuration: const Duration(milliseconds: 150),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return FadeTransition(
                            opacity: CurveTween(curve: Curves.easeInOut)
                                .animate(animation),
                            child: child,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return CustomTransitionPage(
                    child: Container(),
                    transitionDuration: const Duration(milliseconds: 150),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return FadeTransition(
                        opacity:
                        CurveTween(curve: Curves.easeInOut).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/cart',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return CustomTransitionPage(
                    child: const CartScreen(),
                    transitionDuration: const Duration(milliseconds: 150),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return FadeTransition(
                        opacity:
                        CurveTween(curve: Curves.easeInOut).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return CustomTransitionPage(
                    child: Container(),
                    transitionDuration: const Duration(milliseconds: 150),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return FadeTransition(
                        opacity:
                        CurveTween(curve: Curves.easeInOut).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartScreenProvider>(
            create: (_) => CartScreenProvider()),
        ChangeNotifierProvider<CategoryScreenProvider>(
            create: (_) => CategoryScreenProvider()),
        ChangeNotifierProvider<AppBarProvider>(
            create: (_) => AppBarProvider(context)),
      ],
      child: MaterialApp.router(
        routerConfig: _routera,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          dialogTheme: DialogTheme(
            backgroundColor: const Color(0xffFFFFFF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          scaffoldBackgroundColor: Colors.white,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          primaryColor: const Color(0xff3364E0),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0xff3364E0),
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        title: "FoodieCart",
      ),
    );
  }
}
