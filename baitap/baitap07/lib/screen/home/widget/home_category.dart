import 'package:baitap07/model/category_news.dart';
import 'package:baitap07/provider/category_news_provider.dart';
import 'package:baitap07/routes/routes.dart';
import 'package:baitap07/screen/home/all_news.dart';
import 'package:baitap07/screen/widget/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key, required this.idCategory});
  final int idCategory;
  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<CateNewsProvider>().getCategory(widget.idCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text("No data"),
            );
          } else {
            List<CategoryNews> listData = snapshot.data as List<CategoryNews>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listData[0].article,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllNewsScreen(
                                    idCategory: widget.idCategory),
                              ));
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(color: Colors.yellow),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return AspectRatio(
                        aspectRatio: 3 / 1,
                        child: Item(
                          imageUrl: listData[index].thumb,
                          content: listData[index].content,
                          title: listData[index].title,
                          description: listData[index].description,
                        ));
                  },
                )
              ],
            );
          }
        });
  }
}
