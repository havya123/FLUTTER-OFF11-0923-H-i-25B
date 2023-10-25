import 'package:baitap07/model/category_news.dart';
import 'package:baitap07/provider/category_news_provider.dart';
import 'package:baitap07/screen/home/widget/home_category.dart';
import 'package:baitap07/screen/widget/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllNewsScreen extends StatefulWidget {
  AllNewsScreen({required this.idCategory, super.key});
  int? idCategory;
  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<CateNewsProvider>().getCategory(widget.idCategory),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CategoryNews> listData = snapshot.data as List<CategoryNews>;
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.orange,
                  centerTitle: true,
                  title: Text(listData[0].article),
                ),
                body: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: listData.length,
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
                  ),
                )));
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
