import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_cart/screens/cart_screen/cart_screen_provider.dart';
import 'package:foodie_cart/screens/cart_screen/cart_screen_view.dart';
import 'package:foodie_cart/screens/category_screen/category_screen_provider.dart';
import 'package:foodie_cart/widgets/bottom_nav_bar_wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routerDelegate = BeamerDelegate(
    initialPath: '/a',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/a': (context, state, data) => const ScaffoldWithBottomNavBar(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartScreenProvider>(
            create: (_) => CartScreenProvider()),
        ChangeNotifierProvider<CategoryScreenProvider>(
            create: (_) => CategoryScreenProvider())
      ],
      child: MaterialApp.router(
        routerDelegate: routerDelegate,
        routeInformationParser: BeamerParser(),
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: routerDelegate),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,

          dialogTheme: DialogTheme(
            backgroundColor: const Color(0xffFFFFFF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
          ),
          canvasColor: const Color(0xff3364E0),
          primaryColorDark: const Color(0xff3364E0),
          primaryColorLight: const Color(0xff3364E0),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          primaryColor: const Color(0xff3364E0),
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          colorScheme: const ColorScheme.light().copyWith(
            primary: const Color(0xff3364E0),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0xff3364E0),
            backgroundColor: Colors.white,
            elevation: 2,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        title: "FoodieCart",
      ),
    );
  }
}
