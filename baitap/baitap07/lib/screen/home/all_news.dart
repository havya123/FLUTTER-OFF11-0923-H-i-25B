import 'package:baitap07/model/category_news.dart';
import 'package:baitap07/provider/category_news_provider.dart';
import 'package:baitap07/screen/widget/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  late Future getCategory;
  // int id =  ModalRoute.of(context)!.settings.arguments as int;

  @override
  void initState() {
    super.initState();
    // getCategory = context.read<CateNewsProvider>().getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text("The thao"),
      ),
      body: FutureBuilder(
          future: getCategory,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CategoryNews> listData = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) => Item(
                    imageUrl: listData[index].thumb,
                    title: listData[index].title,
                    content: listData[index].content,
                    description: listData[index].description),
                itemCount: listData.length,
              );
            } else {
              return const Center(
                child: Text("No data"),
              );
            }
          }),
    );
  }
}
