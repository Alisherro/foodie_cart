import 'package:flutter/material.dart';
import 'package:foodie_cart/screens/category_screen/category_screen_provider.dart';
import 'package:foodie_cart/services/http_helper.dart';
import 'package:foodie_cart/widgets/dish_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/filter_chip.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void deactivate() {
    context.read<CategoryScreenProvider>().selectedIndex = 0;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CategoryScreenProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://s3-alpha-sig.figma.com/img/738e/6e77/a92971e6075b85d18be0de93205d90cb?Expires=1687737600&Signature=CviOR2T3fFb157NIU9razzN2LfobSUjCGyZ76AI506SnPxZn8ec2WgO7251cjwYSENykkTl7Y-K~V7jEMXnh3r072fBmyJUj7ptB2vyHkOTg3HKAMS0GhSorPbmVem7~0jPn4kKk5Mrcgapkf-GaUVZTvmMc5~pBZCfjRkysIkLPOxj8f2ArUqkRW1eCBNsbxEqoJfvnQMOhcsnMZsURMznUrYKRETyVxdbL0lo2YEv7ZWuIUfSu8LEFDpx2t60IIijSwV9bQ9NU2DDjTWncVNyHr5HmElMiejKwCXexvaSCYQJXdCkBectc0JW0-aaFjfgqbcPrbvgZ53Q~K8QzBg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                scrollDirection: Axis.horizontal,
                itemCount: provider.filters.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? 16 : 8, right: index == 3 ? 16 : 0),
                    child: GestureDetector(
                      onTap: () {
                        provider.onCategoryTap(index);
                      },
                      child: FilterChipsWidget(
                        title: provider.filters[index],
                        isSelected: provider.selectedIndex == index,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 150,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 14,
                  crossAxisCount: 3,
                ),
                children: provider.dishesList
                    .where((element) => element.tags!
                        .contains(provider.filters[provider.selectedIndex]))
                    .map(
                      (e) => DishWidget(
                        dishes: e,
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
