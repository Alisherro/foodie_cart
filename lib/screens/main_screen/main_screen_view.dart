import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/http_helper.dart';
import '../category_screen/category_screen_provider.dart';
import '../category_screen/category_screen_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
                size: 30,
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
      body: FutureBuilder(
        future: HttpService.fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  CategoryScreen(
                                categoryName:
                                    snapshot.data!.listCategories![index].name!,
                              ),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 148,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(snapshot
                                      .data!.listCategories![index].imageUrl!),
                                ),
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            Positioned(
                              left: 16,
                              top: 12,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  snapshot.data!.listCategories![index].name!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
