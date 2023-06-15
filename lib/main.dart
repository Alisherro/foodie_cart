import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_cart/screens/cart_screen/cart_screen_provider.dart';
import 'package:foodie_cart/screens/category_screen/category_screen_provider.dart';
import 'package:foodie_cart/widgets/app_bar_widget.dart';
import 'package:foodie_cart/widgets/bottom_nav_bar_wrapper.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() async {
  initializeDateFormatting("ar_SA", null);
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
            create: (_) => CategoryScreenProvider()),
        ChangeNotifierProvider<AppBarProvider>(
            create: (_) => AppBarProvider(context)),
      ],
      child: MaterialApp.router(
        routerDelegate: routerDelegate,
        routeInformationParser: BeamerParser(),
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: routerDelegate),
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
