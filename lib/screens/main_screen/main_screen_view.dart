import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../services/http_helper.dart';
import '../../widgets/app_bar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarWidget()),
      body: FutureBuilder(
        future: HttpService.fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          context.go(
                            '/main/details/${snapshot.data!.listCategories![index].name}',
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
