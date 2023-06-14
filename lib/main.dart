import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        primaryColor: Color(0xff3364E0),
        appBarTheme: AppBarTheme(
            surfaceTintColor: Colors.white,
            elevation: 0,
            backgroundColor: Colors.white),
        useMaterial3: true,
        colorScheme: ColorScheme.light().copyWith(background: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xff3364E0),
          backgroundColor: Colors.white,
          elevation: 1,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      title: "FoodieCart",
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.location_on_outlined,
                size: 25,
              ),
            ),
            SizedBox(width: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Санкт-Петербург",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4),
                Text(
                  '12 Августа, 2023',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                'https://s3-alpha-sig.figma.com/img/738e/6e77/a92971e6075b85d18be0de93205d90cb?Expires=1687737600&Signature=CviOR2T3fFb157NIU9razzN2LfobSUjCGyZ76AI506SnPxZn8ec2WgO7251cjwYSENykkTl7Y-K~V7jEMXnh3r072fBmyJUj7ptB2vyHkOTg3HKAMS0GhSorPbmVem7~0jPn4kKk5Mrcgapkf-GaUVZTvmMc5~pBZCfjRkysIkLPOxj8f2ArUqkRW1eCBNsbxEqoJfvnQMOhcsnMZsURMznUrYKRETyVxdbL0lo2YEv7ZWuIUfSu8LEFDpx2t60IIijSwV9bQ9NU2DDjTWncVNyHr5HmElMiejKwCXexvaSCYQJXdCkBectc0JW0-aaFjfgqbcPrbvgZ53Q~K8QzBg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemBuilder: (context, index) => Container(
                  height: 148,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Корзина'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Аккаунт'),
        ],
      ),
    );
  }
}
